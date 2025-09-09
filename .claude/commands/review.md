---
description: AI code review using specialized subagents (/review)
---

Perform comprehensive code review using specialized AI agents working in parallel

**IMPORTANT**: Never modify files - only output review files

## Execution Conditions

You must verify the following conditions before proceeding:

- Pull Request exists for the current branch (draft or opened)

If any condition is not met:

- Stop the process immediately
- Notify the user which condition failed
- Do not proceed with implementation

## Specialized Review Agents

The review system employs 8 domain-specific agents:

1. Product Manager: Requirements alignment, acceptance criteria
2. Backend Developer: Server-side architecture, APIs
3. Frontend Developer: UI components, state management, performance, cache strategies
4. UI Engineer: Web standards consistency for UI
5. Infrastructure Engineer: GoogleCloud, Terraform
6. Database Engineer: PostgreSQL, ORMs, Redis
7. Quality Engineer: Testing, reliability, maintainability
8. Refactoring Expert: Code quality, naming conventions, design principles

## Execution Process

When all conditions are met, execute these phases in order:

### Phase 1: Verify Pull Request Existence and Get Information

```bash
# Get current branch (already checked out to Pull Request branch)
current_branch=$(git branch --show-current)

# Check if Pull Request exists for current branch
pr_number=$(gh pr list --head "$current_branch" --state all --json number --jq '.[0].number')

# Verify Pull Request exists
if [ "$pr_number" = "null" ] || [ -z "$pr_number" ]; then
    exit 1
fi

# Get base branch from Pull Request information
base_branch=$(gh pr view "$pr_number" --json baseRefName --jq '.baseRefName')
```

### Phase 2: Collect Diff

```bash
# Get changed files and diff
changed_files=$(git diff --name-only ${base_branch}...HEAD)
git_diff=$(git diff ${base_branch}...HEAD)
```

### Phase 3: Select Agents

Analyze the context and changes to determine which specialized subagents to invoke:

1. **Analyze Changed Files and Directories**

   - Examine file extensions, paths, and directory structure
   - Review git diff content to understand the nature of changes

2. **Determine Required Agents**

   Based on the analysis, select relevant subagents:

   - Always invoke: pm-reviewer, qa-reviewer, refactoring-reviewer
   - Conditionally invoke based on changes:
     - backend-reviewer: When changes in any backend files
     - frontend-reviewer: When changes any in frontend files
     - ui-reviewer: When changes in any frontend files
     - infrastructure-reviewer: When changes in any infrastructure files

### Phase 4: Parallel Agent Execution

1. **Launch selected subagents in parallel**

Let subagents review for domain-specific areas.

2. **Check execution**

Verify that all the selected subagents are running. If there is any subagent not running, be sure to execute them.

### Phase 5: Result Aggregation

1. **Collect Agent Outputs**

   - Wait for all the selected subagents to complete
   - Gather findings from each output file (e.g. `./tmp/pm-review.md` or `./tmp/backend-review.md`)

2. **Categorize Findings**

   Group all findings by severity:

   - ❌ Critical Issues: Must-fix problems
   - ⚠️ Minor Issues: Non-critical improvements
   - ℹ️ Info & Questions: Clarifications needed

3. **Maintain Attribution**
   - Preserve which agent provided each finding
   - Format: `[Agent Name] Finding description (file:line)`

### Phase 6: Generate Unified Report

Create comprehensive review report in `./tmp/review.md`.

### Phase 7: Completion Report

Provide summary to user:

- Critical issues to do the next
- Output files

