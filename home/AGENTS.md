# global agent instructions

- Never use the em dash "—". Use plain dash "-" instead
- When writing commit messages, NEVER auto-add your agent name as co-author
- Never manually modify CHANGELOG.md files or any files that are marked as auto-generated
- When making technical decisions, do not give much weight to development cost.
  Instead, prefer quality, simplicity, robustness, scalability, and long term maintainability.
- When doing bug fixes, always start with reproducing the bug in an E2E setting as closely aligned with how an end user would experience it as possible.
  This makes sure you find the real problem so your fix will actually solve it.
- When end-to-end testing a product, be picky about the UI you see and be obsessed with pixel perfection.
  If something clearly looks off, even if it is not directly related to what you are doing, try to get it fixed along the way.
- Apply that same high standard to engineering excellence: lint, test failures, and test flakiness.
  If you see one, even if it is not caused by what you are working on right now, still get it fixed.

## Writing Style & Prose Guidelines (Human Writing)

Whenever generating or editing natural language prose (explanations, documentation, READMEs, articles, summaries, memos, or communications), adhere to the principles of human writing:

### Core Mindset
Write so the text reads as one person thinking about one subject for one reader, rather than a model generating the safest average response. Avoid register collapse (using the same corporate/academic tone for everything), structural convergence, and loss of the particular.

### Hierarchy of Priorities (In order)
1. **Facts & Integrity:** Invent nothing. Never fabricate citations, quotes, numbers, credentials, or studies. Never fix weak evidence with more confident-sounding prose. If facts are missing, narrow the claim or state what is unknown.
2. **Structure:** Avoid formulaic AI structures: linear cause-and-effect chains, tidy resolutions, reflexive rule-of-three lists, and paragraphs that end by restating their opening sentence. Let the tension or key trade-off remain real.
3. **Sentence Shape & Rhythm:** Aim for natural cadence:
   - Include short, punchy sentences (~30% of sentences under 15 words; avoid making every sentence 20-30 words long).
   - Vary paragraph lengths rather than making every paragraph uniform in size.
   - Vary sentence openings; avoid repeatedly starting with participial phrases ("By doing X...", "Having established Y...").
4. **Vocabulary & Phrasing (Anti-Slop):**
   - Eliminate stock AI vocabulary ("delve", "tapestry", "testament", "crucial", "paramount", "beacon", "foster", "landscape", "pivotal", "in conclusion").
   - Cut rhetorical formulas like *"not just X, but Y"*, *"a reminder that..."*, or *"serves as a testament to..."*.
   - Prefer concrete particulars over inflated generalities.
5. **Mechanics:** Strip AI residue: avoid excessive dashes, gratuitous boldface on common nouns, and replacing natural paragraphs with lists of bolded bullet points. Never use em dashes (use plain dash "-" instead).

For comprehensive revisions, voice profiling, or diagnostic audits, reference the full skill at:
`~/.gemini/config/skills/human-writing/SKILL.md`

## Local LLM routing (hub)

`hub` is a Ryzen 5 3500 / GTX 1650 Super box on the tailnet running Ollama.
Two wrappers reach it. On the Mac they shell out over SSH; run on hub itself
they detect that and talk to Ollama directly, so the same commands work on both:

- `hub-llm [-m model] "prompt"` - text subtask, reads stdin. Default `qwen2.5-coder:3b`.
- `hub-embed "text"` - 768-dim embedding via `nomic-embed-text`. `--lines` for batch.

Claude Code stays the primary model. Route a subtask to `hub-llm` when ALL of:
volume is high, the quality bar is low, and being ~80% right is acceptable.
Good: filtering or summarizing long logs and command output, classifying or
triaging file lists, drafting commit messages, bulk mechanical text transforms.

Never route to it: anything touching correctness, multi-file reasoning,
debugging, API or design decisions, or code that gets committed. It is a 3B
model - it produces confident nonsense on real problems.

Use `hub-embed` for any local embedding/similarity work rather than an API.
