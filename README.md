# config

My dotfiles, shared agent instructions, and skills. The Nix configuration targets my Apple Silicon Mac; the shared files also live on my Linux machine.

## Agent workflow

- I've moved to omp with Antigravity, Claude, and Codex in my workflow.
- Shared instructions and skills stay in this repo. Provider credentials, omp state, sessions, and personal context stay local.

OpenSuperWhisper is part of my setup too.

## Files

```text
configuration.nix        macOS defaults and Homebrew packages
home.nix                 Home Manager packages, aliases, and symlinks
home/AGENTS.md           shared agent instructions
home/.claude/settings.json
home/.config/            Neovim, WezTerm, and herdr
home/skills/             shared skills
```

Home Manager links the instructions into Claude, Codex, OpenCode, and Gemini. It links `home/skills/` into `~/.claude/skills`, `~/.agents/skills`, and `~/.gemini/config/skills`.

On Linux, the current setup uses symlinks to these shared sources. Private context lives in `~/context/`, outside this public repo. The Nix flake and rebuild script are macOS-only; this repo doesn't install or configure omp providers.

## Skills

- `human-writing`: Sahil's human text skill, for drafting and editing prose.
- `casual-voice`: spoken register for terminal lines, chat, and agent personas.
- `readme`: my custom README conventions.
- `phosphor-icons`: icon selection and implementation patterns.
- `no-mistakes`: validation through the separately installed `no-mistakes` CLI.

Skills are instructions, not proof that a model performs better. Review them when models or tooling change. No skills were removed in this update.

## Apply on the Mac

With Nix, nix-darwin, and Home Manager already set up:

```bash
./rebuild.sh
```

This runs `sudo darwin-rebuild switch` for `RyansMacBook`. Homebrew activation keeps unlisted packages and doesn't use `--force`. The script refuses non-macOS hosts before making changes.

## Safety

`cc` and `co` launch `claude` and `codex` without permission-bypass or auto-approval flags. Claude's dangerous-mode warning remains enabled. These defaults don't make agent execution a sandbox; check each tool's permissions before use.

Don't copy whole agent home directories into this repo. Keep tokens, private keys, account-synced skill bundles, histories, and personal memories out of commits. `.gitignore` excludes common sensitive paths, but it doesn't protect already-tracked files or catch every secret.
