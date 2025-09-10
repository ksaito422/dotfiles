---
description: Create implementation plan based on context file (/design <path_to_context_file>)
---

Generate a complete implementation plan for general feature implementation with thorough research. Ensure context is passed so AI agents can perform self-verification and iterative improvement. First, read the feature file to understand what needs to be created, how provided examples can help, and if there are other considerations.

The AI agent only gets the context you are appending to the implementation plan and training data. Assume the AI agent has access to the codebase and the same knowledge cutoff as you, so it's important that your research findings are included or referenced in the implementation plan. The agent has web search capabilities, so pass URLs to documentation and examples.

## Context
Refer to $ARGUMENTS.

## Research Process

### Phase 1: Codebase Analysis
- Search for similar features/patterns within the codebase
- Identify files to reference in the implementation plan
- Document existing conventions to follow
- Check test patterns for validation approaches

### Phase 2: External Research
- Search the web for similar features/patterns
- Library documentation (include specific URLs)
- Implementation examples (official docs / GitHub / Stack Overflow / blogs)
- Best practices and common pitfalls
- Use web search tools for external documentation and examples

### Phase 3: User Clarification (if needed)
- What are the specific patterns to mimic and where are they?
- What are the integration requirements and where are they?

## Implementation Plan Generation

### Critical Context
Important context that should be included and passed to AI agents as part of the implementation plan:
- Documentation: URLs with specific sections
- Code examples: Actual snippets from codebase
- Gotchas: Library quirks, version issues
- Patterns: Existing approaches to follow

### Implementation Blueprint
- Start with pseudocode showing approach
- Reference actual files for patterns
- Include error handling strategies
- List tasks that must be completed to fulfill the implementation plan, in the order they should be completed

**_Critical: After completing research and codebase exploration, before starting to create the implementation plan_**
**_Think deeply about the implementation plan and plan your approach before starting to create the implementation plan_**

### Save and Commit Implementation Plan
- Save implementation plan as `./tmp/plan.md` in Japanese

