# config

- My dotfiles, shared agent instructions, and skills.
- I use omp with Antigravity, Claude, and Codex.
- `home/AGENTS.md` links into Claude, Codex, OpenCode, and Gemini.
- `home/skills/` links into `~/.claude/skills`, `~/.agents/skills`, and `~/.gemini/config/skills`.
- Skills:
  - `human-writing`: Sahil's human text skill
  - `casual-voice`: spoken register for terminal, chat, and personas
  - `readme`: my README conventions
  - `phosphor-icons`: icon patterns
  - `no-mistakes`: validation via the `no-mistakes` CLI
- `./rebuild.sh` applies the Nix config to my Mac. It's macOS-only and exits before changing anything elsewhere.
- Homebrew keeps unlisted packages.
- Credentials, omp state, sessions, and `~/context/` stay local, never in this repo.
- `cc` and `co` launch `claude` and `codex` without permission-bypass flags. That's not a sandbox.
- `.gitignore` won't catch every secret.
