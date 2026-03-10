# claude-config

My personal Claude Code configuration — agents, skills, commands, rules, and settings.

Built on top of [everything-claude-code](https://github.com/affaan-m/everything-claude-code).

## What's inside

```
claude/
├── CLAUDE.md          # Global identity, working style, code principles
├── settings.json      # Model, hooks, env vars, autocompact settings
├── agents/            # Subagents (architect, planner, code-reviewer, security...)
├── commands/          # Slash commands (/plan, /tdd, /code-review, /checkpoint...)
├── rules/             # Always-follow guidelines (security, testing, git, style...)
└── skills/            # Workflow definitions and domain knowledge
```

## Install

```bash
git clone https://github.com/aleon/claude-config.git ~/claude-config
cd ~/claude-config
chmod +x install.sh
./install.sh
```

The script creates symlinks from `~/.claude/` → `~/claude-config/claude/` so any changes
you make (or pull from the repo) take effect immediately without reinstalling.

## Update

```bash
cd ~/claude-config
git pull
```

That's it — symlinks mean there's nothing to reinstall.

## Customizing per project

Add a `CLAUDE.md` at the root of any project for project-specific instructions.
Claude Code merges it with the global one automatically.

```bash
touch my-project/CLAUDE.md
```

## Structure philosophy

- **`CLAUDE.md`** — who you are, how you work, what requires approval
- **`settings.json`** — technical config (model, hooks, env)
- **`rules/`** — non-negotiable guidelines Claude always follows
- **`agents/`** — specialized subagents for delegated tasks
- **`commands/`** — slash commands for common workflows
- **`skills/`** — deep domain knowledge loaded on demand
