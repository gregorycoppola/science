# Etymology: What "Objective" Actually Means

The phrase "objective function" carries a hidden philosophical payload that is worth unpacking — because the word "objective" turns out to mean exactly what we need it to mean.

## The Root

The word comes from Medieval Latin *objectivus*, from *objectum* — "that which is thrown before." The Latin components are *ob-* ("before, against") and *iacere* ("to throw"). So the literal root meaning is: *that which is placed in front of you as a target.*

From this root, the word branched into two distinct senses that initially seem unrelated:

**Sense 1 — The goal sense** (from early 15c.): an objective is a target, an aim, a thing striven for. This is the sense in "military objective," and also in "objective function" in optimization — the thing you are minimizing or maximizing.

**Sense 2 — The epistemological sense** (dominant by the 18c., shaped by Kant and German philosophy): objective means *independent of any particular observer's mind* — real, external, not colored by personal feeling or prejudice. This is the sense in "objective evidence" or "an objective measurement."

These two senses feel different. But they share a connecting notion, identified by Merriam-Webster as: *"considered in relation to its own nature."* An objective fact is one that is determined by the nature of the object itself, not by whoever is looking at it.

## Why This Matters for Science

An *objective* objective function for science needs to satisfy both senses simultaneously:

1. It must be a **target** — something science is actually optimizing toward, not just a vague aspiration.
2. It must be **observer-independent** — the same standard should apply regardless of who is doing the science, what culture they come from, or what they want to be true.

Most proposed "goals of science" fail one of these tests. "Find useful knowledge" is a target but not observer-independent (useful to whom?). "Achieve consensus" is a social fact, not a property of the object of inquiry. "Falsifiability" (Popper) gestures at observer-independence but is not a metric — it cannot rank two unfalsified theories against each other.

The Bayesian/Kolmogorov framework satisfies both. The prior `P(H) ∝ 2^{-K(H)}` is observer-independent up to a fixed constant (the choice of universal Turing machine), and the posterior `P(H | D)` is a well-defined target to maximize. The object — the hypothesis — is evaluated on its own nature: its length and its predictive accuracy. No particular observer's preferences enter.

So the phrase "objective objective function" is not redundant. It means: a target (first sense) that is grounded in the nature of the object itself (second sense). The Kolmogorov/Solomonoff framework is the only known candidate that earns both adjectives at once.