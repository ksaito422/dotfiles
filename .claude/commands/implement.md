---
description: Create code based on implementation plan file (/implement <path_to_plan_file>)
---

## Implementation Plan File
Refer to $ARGUMENTS.

## Execution Process

### Phase 1: Load Implementation Plan
- Load the implementation plan file
- Understand all context and requirements from both files
- Follow all instructions in the implementation plan and extend research as needed
- Ensure you have all necessary context to fully implement the implementation plan
- Conduct additional web searches and codebase exploration as needed
- Use web search tools for external documentation and examples

### Phase 2: Development Planning
- Think more deeply before executing the plan. Create a comprehensive plan that addresses all requirements
- Use TODO tools to break complex tasks into smaller, manageable phases
- Use TodoWrite tool to create and track implementation plans
- Identify implementation patterns from existing code to follow

### Phase 3: Execute Plan
- Execute the implementation plan
- Implement all code

### Phase 4: Validation
- Run formatting, linting, and testing tools to ensure code quality
- Fix any failures
- Verify that acceptance criteria are met

### Phase 5: AI Comment Cleanup
- Review all AI-generated comments in the implemented code
- Remove redundant comments that merely repeat what the code already expresses
- Remove commented-out code blocks unless they serve a specific purpose
- Keep only comments that provide valuable context that cannot be expressed through code structure
- Make code self-explanatory through clear naming and structure rather than excessive commenting
- Apply the principle: "Comment what the code cannot say, not simply what the code does not say"

ref: https://github.com/97-things/97-things-every-programmer-should-know/tree/master/en/thing_16

### Phase 6: Commit Changes
Ask sub-agents to commit changes.

### Phase 7: Completion
- Ensure all checklist items are completed
- Re-read the implementation plan and verify that everything has been implemented
- Report completion status
