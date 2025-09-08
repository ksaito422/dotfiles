---
description: Answer questions (/ask)
---

Answer user questions through thorough research and verification.
**Important: Do not modify files - provide research-based answers only**

## Execution Conditions
Before proceeding, verify that the following file exists:
- ./tmp/context.md - User's questions

If the file doesn't exist:
- Stop processing immediately
- Notify the user which conditions were not met
- Do not continue with implementation

## Execution Process

### Phase 1. Load Questions
- Load questions from `./tmp/context.md`
- Parse content to identify individual questions
- Each question may be separated by "=====" or similar delimiters
- Extract file references and context (e.g., tmp/plan.md:L144)

### Phase 2. Research
- For each question, conduct thorough research using sub-agents
- Use Task tool with general-purpose agents for complex research
- Search the codebase for patterns, implementations, and context related to questions
- Use web search tools for external documentation and examples

### Phase 3. Verification and Analysis
- Read referenced files and understand context
- Search for relevant code patterns and implementations
- Look for documentation and examples
- Follow strict guidelines to prevent hallucination:
  - Use only information directly found in codebase, documentation, or research results
  - When making claims about code or documentation, use direct quotes from source files
  - If no evidence exists to support a claim, clearly state "I don't know" or "no evidence found"
  - Clearly distinguish between verified findings and speculation
- Think more deeply before answering questions

### Phase 4. Answer Questions
- **Important**: Apply critical thinking to question premises before determining final answers

Provide responses to users:
- Provide clear, concise answers for each question
- Reference specific files and line numbers when relevant (format: filepath:line_number)
- Reference specific URLs based on answers
- Include code snippets or examples when useful
- Clearly separate answers for multiple questions
- Specifically distinguish between findings and speculation

For multiple questions, format as follows:

```
## Question 1: [Question summary]
[Answer including specific references and findings]

## Question 2: [Question summary]
[Answer including specific references and findings]
```
