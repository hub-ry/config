---
name: readme
description: >
  Write, rewrite, audit, and structure project READMEs in Ryan's preferred style: simple,
  to the point, mostly bullets, few headers, no horizontal rules. Covers what the project
  does and why, how the mechanism works, a quickstart, and keys, storage, or hosting notes
  when the project actually has them. Builds on human-writing for prose. Never invents
  commands, paths, URLs, hosts, or sources.
license: MIT
metadata:
  version: "2.0.0"
---

# README

Write READMEs the way Ryan likes them: one builder telling another engineer what the thing is and how to use it, in as few words as that takes.

This is a stated preference, modeled on a few of his repos (`phackers-hacknight1`, `swatch`, `feynman`, `feynman-slides`). It isn't a tested measure of his voice. His own edits to a README win over anything here.

## Default shape

- A title, then a bullet list. Add a header only when a part would get lost without one, like a long keys table or a quickstart block.
- No `---` separators.
- The first bullet says what the project does. If there's a real reason it exists or a bet behind the design, say that next.
- Keep bullets short. A bullet can run to two sentences when the mechanism needs it.
- Match length to the project. A small repo might need five bullets.

## Include when it applies

Only include what the project actually has. Don't add a part to complete a template, and never invent a command, path, URL, host, number, or source.

- **Why the design.** Mechanisms and tradeoffs, not just features. "Plain JSON on disk, because a local app doesn't need a database."
- **Quickstart.** Commands that actually run in this repo, plus prerequisites and credentials.
- **The loop.** A numbered list only if the project really runs in steps, with as many steps as it has.
- **Keys.** For an interactive app or CLI with shortcuts, a table of them, taken from the code.
- **Storage.** Where files live, the format, and any limits, if the project keeps state.
- **Research or history.** A line or two with real, linked sources (DOIs or canonical links), only when the approach is based on one.
- **Hosting.** How and where it runs and the live URL, only if it's actually deployed and the user wants that public.
- **Limits and safety.** What it doesn't do, what it needs, and what it touches.
- **`Casual Projects build!` opener.** Some of Ryan's project READMEs start with it. Use it only when the user says the project belongs to that set.

## Writing

- Use `human-writing` for the prose: facts first, plain verbs, no stock AI phrasing, a register that fits.
- Ryan prefers no em dashes and none of the usual stock words (*delve*, *tapestry*, *testament*, *crucial*, *pivotal*, *landscape*, *serves as*, *not just X, but Y*) in his READMEs. That's a style preference, not an authorship test. Apply it to text you write, never to quotations, code, commands, or names.
- Mostly short sentences, with no quota. Don't chop a sentence to hit a count.
- When editing, keep every command, keybinding, path, limit, and concrete fact unless it's wrong or the user asks to cut it. Leave quotations and code blocks exactly as they are.

## Examples from Ryan's repos

These show what each part looks like when a project has it. Don't carry their facts into another project.

- `phackers-hacknight1` / `swatch`: data collection and embedding dimensions (12 brands, 512-d CLIP vectors), the recommendation math in plain words (normalizing vectors, subtracting the corpus average to exaggerate differences), why several taste vectors beat one (averaging two dissimilar items gives a mediocre vector that splits the difference), and a short hosting note with the live link.
- `feynman`: a sharp opening ("Study by building a deck and then teaching it out loud. The deck is the studying; the teaching pass is the check that you actually understood it."), a four-step loop from outline to speech grading to spaced repetition, scoring as the lower of your rating and the model's, a file layout table, and "State is plain JSON on disk. No server, no database."
- `feynman-slides`: "Slides you are not allowed to get wrong." Why the method works (Feynman's Princeton notebook, the self-explanation and protégé effects), why jargon blocks export, a full shortcut table, local storage with a 100GB safety cap, and hosting on `slim` via Cloudflare Tunnel.

## Checklist

- [ ] The first bullet says what the project does.
- [ ] Bullets, few headers, no `---`.
- [ ] Every part matches something the project actually has. Nothing was filled in to complete a shape.
- [ ] Commands, paths, keys, URLs, and numbers come from the repo or the user.
- [ ] Sources are real and linked.
- [ ] Quotations and code are untouched.
- [ ] Optional: run `scripts/scan.py` from the installed `human-writing` skill on the README as a prose diagnostic. It counts patterns. It doesn't check facts or decide whether the README is done.
