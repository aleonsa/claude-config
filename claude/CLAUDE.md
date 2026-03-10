# Claude Code — Global Config (Alejandro)

## Who I Am
Full-stack developer working on APIs, web apps, and generative AI products.
Primary stack: Python, TypeScript/React, Go.
Infra: Docker, PostgreSQL, GitHub.

## Working Style
- **Collaborative, step-by-step.** Don't execute large changes in one shot.
- **Low autonomy by default.** Ask before making architectural decisions, deleting files, changing schemas, or doing anything irreversible.
- Before starting any non-trivial task, confirm your understanding of the goal and outline the plan. Wait for my approval before proceeding.
- When in doubt: ask, don't assume.

## Communication
- Be concise. Skip filler phrases ("Great question!", "Certainly!").
- When you're uncertain, say so explicitly.
- Flag tradeoffs and risks proactively — don't just do the "obvious" thing.
- Respond in the same language I use (Spanish or English).

## Code Principles
- Prefer simple, readable code over clever code.
- No premature abstractions — solve the actual problem first.
- Never hardcode secrets, API keys, or credentials.
- Always handle errors explicitly — no silent failures.
- Write code that's easy to delete and replace, not just easy to extend.

## Python
- Use type hints everywhere.
- Prefer `pathlib` over `os.path`.
- Use `pydantic` for data validation.
- Virtual environments via `uv` or `venv`. Never install globally.
- Testing with `pytest`. Aim for 80%+ coverage on business logic.

## TypeScript / React
- Strict TypeScript — no `any` unless truly unavoidable.
- Functional components + hooks only (no class components).
- Colocate tests with the code they test.
- Use `zod` for runtime validation at API boundaries.

## Go
- Follow standard Go project layout.
- Errors are values — handle them explicitly, no panics in library code.
- Use `context` for cancellation and deadlines.
- Table-driven tests with `t.Run`.

## Git
- Commit messages: `type(scope): description` (conventional commits).
- Small, focused commits. One logical change per commit.
- Never force-push to main/master.
- Always review the diff before committing — ask me to review it too.

## Docker / PostgreSQL
- Use multi-stage builds for production Docker images.
- Never run as root in containers.
- DB migrations via versioned SQL files (not auto-generated ORM migrations unless I say so).
- Always use connection pooling in production.

## Generative AI Projects
- Separate prompt logic from business logic — prompts are code, version them.
- Always log inputs/outputs for debugging (with PII scrubbing if needed).
- Prefer structured outputs (JSON mode / tool use) over parsing free text.
- Be explicit about model selection — don't default to the most expensive model.

## Agents & Delegation
- Use subagents for isolated, well-defined tasks (code review, security scan, TDD).
- Don't delegate tasks that require my context or judgment.
- Available agents: architect, planner, code-reviewer, security-reviewer, tdd-guide, refactor-cleaner.

## What Requires My Approval
- Any change to database schema or migrations
- Deleting or renaming files
- Changes to environment variables or config files
- Anything that touches authentication or security
- Merging or pushing to main/master
- Installing new dependencies
