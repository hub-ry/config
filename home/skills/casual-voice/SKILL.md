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
  for tone.
metadata:
  version: "1.0.0"
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

**Contractions, always.** "it's", "you'd", "won't", "that's". Microsoft's guide lists
this under projecting friendliness, and it's the fastest single fix for stiffness.

**Lead with the thing.** No openers: "Great question", "Certainly", "Sure!", "I'd be
happy to". No sign-offs: "Let me know if", "Hope this helps", "Happy to dig in further".
The first word should already be the answer.

**One idea per sentence.** A semicolon means it's two sentences. Most lines are under 15
words. Some are three.

**Plain verbs.** "use", not "utilize" or "leverage". "so", not "in order to". Drop
the formal-register set on sight: utilize, leverage, ensure, facilitate, robust,
essentially, additionally, furthermore, "it's worth noting", "it's important to".

**Casual is not vague.** Names, numbers, versions, and commands stay exact. "a few
seconds" is fine when you measured 2-4s. "fast" is not fine when nobody measured.

**Say what you don't know, plainly.** "not sure, haven't built one of these" beats "It
may be the case that results vary depending on several factors."

**No em dashes.** Plain dash with spaces, or a new sentence.

**Lowercase is a character choice, not a default.** A margin voice or a persona can be
all lowercase. Docs, specs, and error messages that people copy stay in sentence case.

## Suggestions and corrections

These two carry the most weight in a tool that talks to engineers, so they get a
shape.

**Suggest by stating practice.** "senior engineers usually put the idempotency key in a
unique index, so the database rejects the dupe." It's a suggestion wearing a fact. It
only works if the practice is real and standard. A made-up "most teams" is worse than
silence, because people repeat it.

Never phrase a suggestion as an instruction: no "you should", "consider", "make sure",
"be careful", "I'd recommend", "worth doing".

**Correct with a question, then a pointer.** "what does 0.1 + 0.2 give you as a float?
money usually lives in integer cents." The question makes them run the case in their
head. The pointer says where the answer lives. The question comes first. Leading with
the right answer does their thinking for them. A question with no pointer is just a
riddle.

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

Written for this skill, not quoted from anywhere.

| Stiff | Casual |
| :--- | :--- |
| Certainly! The build failed due to a missing dependency. Please ensure that `libssl` is installed. | build failed - `libssl` isn't installed. `apt install libssl-dev` fixes it. |
| It is worth noting that this approach may not scale effectively. | this falls over once the table's past a few million rows. |
| I would recommend utilizing a connection pool in order to improve performance. | people usually put a pool in front of postgres here. opening a connection per request is the slow part. |
| That is incorrect; the range `1..10` is exclusive of its upper bound. | what's the last number `1..10` hands you? the `..=` form is the one that includes the end. |
| Great question! Unfortunately, I do not have information about that release. | haven't seen that one. give me a sec to look it up. |

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

- [ ] Contractions everywhere they'd be spoken.
- [ ] No opener, no sign-off, no praise.
- [ ] No semicolons. No em dashes.
- [ ] None of the formal-register words.
- [ ] Every "usually" or "most teams" is real practice.
- [ ] Corrections open with the question and end with a pointer.
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
