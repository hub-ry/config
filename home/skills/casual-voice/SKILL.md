---
name: casual-voice
description: >
  Write short lines a person reads mid-task, in a spoken, casual register: chat and
  terminal replies, CLI and TUI copy, error messages, Slack messages, landing pages and
  product copy (headlines, ledes, store and extension descriptions, popups, privacy
  blurbs), and the voices of in-product characters or agent personas (including the
  system prompts that define them). Use when text should sound like one engineer talking to another at their desk,
  when a persona or tool sounds stiff, corporate, or like documentation, or when writing
  or tuning a prompt that sets an agent's voice. Complements human-writing, which covers
  long-form prose and deliberately does not make things casual. Never trades accuracy
  or a precise instruction for tone.
metadata:
  version: "1.1.0"
  sources:
    - "Kate Moran, The Four Dimensions of Tone of Voice, Nielsen Norman Group, 2016"
    - "Microsoft Writing Style Guide, Top 10 tips for Microsoft style and voice"
    - "Mailchimp Content Style Guide, Voice and Tone"
    - "dum-intern wizard evals, 2026-09 (see Tuning a voice prompt)"
---

# Casual voice

Sound like one engineer talking to another at their desk. Not a document, not a
brand, not an assistant.

`human-writing` is for essays, docs, and memos, and it warns against making those
chatty. This skill is for the other register: the line in a terminal, the reply in a
chat, the character in a tool. In that register, formal is the tell.

## Where this voice sits

Nielsen Norman Group describes tone on four dimensions: formal vs. casual, serious vs.
funny, respectful vs. irreverent, matter-of-fact vs. enthusiastic. This voice is:

- **casual** - contractions, short sentences, plain words
- **mostly serious** - dry humor is fine, jokes aren't the point
- **respectful** - never talks down, never flatters
- **matter-of-fact** - no hype, no exclamation marks about ordinary things

Voice stays constant. Tone shifts with the reader's state (Mailchimp's framing). Someone
whose build just failed gets fewer words and no jokes. Someone poking around gets a bit
more room.

## Rules

**Contractions where you'd say them.** "it's", "you'd", "won't", "that's". Microsoft's
guide lists this under projecting friendliness, and it's the fastest single fix for
stiffness.

**Lead with the thing.** No openers: "Great question", "Certainly", "Sure!", "I'd be
happy to". No sign-offs: "Let me know if", "Hope this helps", "Happy to dig in further".
The first word should already be the answer.

**Short sentences.** Most spoken lines are short, and a semicolon usually wants to be two
sentences. Don't split a command, a requirement, or a precise condition just to make it
shorter.

**Plain verbs.** "use", not "utilize" or "leverage". "so", not "in order to". Words like
utilize, leverage, facilitate, robust, essentially, additionally, and furthermore usually
read stiff here; swap them when a plainer word says the same thing. Keep the exact word
when it's the requirement, a name, or quoted text.

**Casual is not vague.** Names, numbers, versions, and commands stay exact. "a few
seconds" is fine when you measured 2-4s. "fast" is not fine when nobody measured.

**Say what you don't know, plainly.** "not sure, haven't checked yet" beats "It may be the
case that results vary depending on several factors." Only claim what's true of whoever is
speaking: no invented experience ("I've built", "in prod we saw"), measurements, or
thresholds.

**Skip em dashes in this voice.** A plain dash with spaces or a new sentence reads more like
speech. If the product's existing copy or the user's own writing uses them, match that.

**Lowercase is a character choice, not a default.** A margin voice or a persona can be
all lowercase. Docs, specs, and error messages that people copy stay in sentence case.

## Suggestions and corrections

**Default: say it straight.** In engineering work a precise instruction or correction is the
respectful version. "`1..10` stops at 9. use `1..=10` to include 10." "the lock's stale -
run `nix flake update` first." Imperatives are fine. The stiff version is the hedged one:
"you might want to consider". Failing builds, urgent fixes, and anything someone will copy
get the answer first.

**Stating practice works too, when the practice is real.** "the idempotency key usually
goes in a unique index, so the database rejects the dupe." A made-up "most teams" is worse
than silence, because people repeat it.

### Optional: margin persona

Some personas are built to nudge instead of tell: a one-line voice in the margin that wants
the reader to work it out (the dum-intern wizard below is one). Use this only when the
persona asks for it:

- **Correct with a question, then a pointer.** "what does 0.1 + 0.2 give you as a float?
  money usually lives in integer cents." The question makes them run the case in their
  head. The pointer says where the answer lives. A question with no pointer is a riddle.
- **State practice instead of giving orders.** "you should", "make sure", and "I'd
  recommend" break this persona.
- **Drop the persona for anything urgent, destructive, or security-related**, or when the
  reader asks for the answer. Say it straight.

## Landing pages and product copy

A landing page is where the model register leaks worst, because the page feels like it
should "sell". It shouldn't. Write it the way you'd explain the thing to a friend who
asked what you built.

- **The headline says what it does.** A plain sentence with a verb, like "Shortens long
  emails when you open them." Two-beat slogans (a short imperative, a full stop, another
  short imperative) read as ad copy, and a reader spots them in one glance.
- **No contrast set-ups.** Don't build a line on "the few X that actually Y", "not just X",
  or "finally, a tool that". State the thing.
- **No flourishes that restate the obvious.** If the feature swaps text in place, say it
  swaps it. Don't add "right where it is" or "without leaving the page" on top.
- **Break the list habit.** Three items joined with "and" at the end of a paragraph is the
  most common tell in privacy and features copy. Two short sentences usually beat one
  tidy triple.
- **Promise only what's true today.** "Coming soon", "on the way", "one click" are claims.
  If nobody has scheduled it, say what's true now instead.
- **Instructions are verbs and keys.** "⌘C copies it" beats "Press ⌘C to copy the short
  version."
- **Read it out loud before shipping.** If you wouldn't say a line to the person next to
  you, rewrite it.

## Examples

Written for this skill, not quoted from anywhere. Each row names the situation instead of
quoting a stiff line, so there's nothing bad to copy.

| Situation | Casual |
| :--- | :--- |
| Build failed on a missing library | build failed - `libssl` isn't installed. `apt install libssl-dev` fixes it. |
| Scaling risk nobody has measured | no idea how this does on a big table yet. a load test on prod-sized data would tell you. |
| Recommending a connection pool | put a pool in front of postgres here. connection setup per request is usually the slow part. |
| Off-by-one in a Rust range | `1..10` stops at 9. use `1..=10` to include 10. |
| Asked about a release you don't know | don't know that release. looking it up. |

## Tuning a voice prompt

When the voice belongs to an agent, the prompt is the product. These were measured on
the dum-intern wizard (a one-line margin voice on Sonnet), over several runs per case:

- **Quoted bad examples get copied back.** Listing "backwards actually" as a thing not to
  say produced "backwards actually" in the next run. Quoting "wait," and "actually" as
  banned openers made them more common. Show only the shape you want.
- **Examples that match your test cases get parroted.** A prompt example about Rust
  ranges made every range test return that exact sentence. Keep eval cases out of the
  prompt, or the eval measures recall, not the voice.
- **When the prompt won't hold a rule, enforce it in code.** Asking nicely for
  question-first corrections still opened most of them with the answer. Tagging each
  line (`fact:` / `nudge:`) and dropping any nudge whose first sentence isn't a question
  fixed it. Pick the enforcement that fails safe: a dropped line costs less than a bad
  one.
- **Models argue themselves out of speaking in prose.** "...not worth interrupting
  for.\n\npass" is a pass. Parse for it at the end, not just the start.
- **Give a persona honest limits.** "You're a persona with no career" keeps "engineers
  usually" claims tied to real practice instead of invented war stories.
- **One run tells you nothing.** Run each case 3-5 times and read every line. Keep a small
  eval script next to the prompt so changes get checked the same way.

## Checklist

- [ ] Contractions where they'd be spoken.
- [ ] No opener, no sign-off, no praise.
- [ ] No semicolons or em dashes, unless the existing copy or the writer uses them.
- [ ] Stiff formal words swapped for plain ones, unless the exact word is the requirement.
- [ ] Every "usually" or "most teams" is real practice. No invented numbers, thresholds,
      or experience.
- [ ] Corrections and instructions are direct and exact. Question-first only for a margin
      persona built for it, and never for an urgent fix.
- [ ] Names, numbers, and commands are exact.
- [ ] For a voice prompt: no quoted bad examples, no examples that match the eval, and
      anything the prompt can't hold is enforced in code.
- [ ] For product copy: the headline is a plain sentence, no contrast set-ups, no
      end-of-paragraph triples, and every promise is already true.

## Sources

- Kate Moran, [The Four Dimensions of Tone of Voice](https://www.nngroup.com/articles/tone-of-voice-dimensions/), Nielsen Norman Group, 2016.
- [Top 10 tips for Microsoft style and voice](https://learn.microsoft.com/en-us/style-guide/top-10-tips-style-voice), Microsoft Writing Style Guide.
- [Voice and Tone](https://styleguide.mailchimp.com/voice-and-tone/), Mailchimp Content Style Guide.
- For long-form prose, use `human-writing` instead.
