# Bayesian Confirmation Theory

## The Question

Confirmation theory asks: when does evidence support a hypothesis, and by how much?

This is the central question of the philosophy of science, and it is harder than it looks. Intuitively: observing a white swan confirms "all swans are white." But does observing a red fire engine confirm it? A red fire engine is a non-black non-raven, and "all ravens are black" is logically equivalent to "all non-black things are non-ravens." If the latter is confirmed by red fire engines, then so is the former. This is the raven paradox (Hempel, 1945), and it shows that naive intuitions about confirmation are inconsistent.

Bayesian confirmation theory provides a principled answer.

## The Bayesian Account

Evidence `E` **confirms** hypothesis `H` if and only if:

    P(H | E) > P(H)

Observing `E` raises the probability of `H`. The degree of confirmation is:

    c(H, E) = P(H | E) - P(H)

or in a ratio form:

    c(H, E) = P(H | E) / P(H)

Both measures capture the idea that confirmation is about probability increase, not absolute probability.

This resolves the raven paradox cleanly. Observing a red fire engine does confirm "all ravens are black" — but only very slightly, because the prior probability of observing a non-black non-raven is so high that the observation barely updates the posterior. Observing a black raven confirms it more strongly, because black ravens are less common than non-black non-ravens and their observation provides more diagnostic information. The paradox dissolves into a matter of degree.

## The Tacking Problem and Irrelevance

A persistent challenge: suppose `H` is confirmed by `E`. Does `H & X` also get confirmed, for any arbitrary `X`? Naively, yes — if `H` is more probable, so is any conjunction containing it. But this seems wrong: confirming "copper conducts electricity" should not confirm "copper conducts electricity and the moon is made of cheese."

The Bayesian answer: `H & X` is confirmed by `E` only if `X` is not screened off — only if `X` is relevant to the probability of `E` given `H`. If `X` is independent of everything relevant, the posterior on `H & X` increases, but only because the posterior on `H` increases; the posterior on `X` itself is unchanged. Tacking on irrelevant conjuncts does not spread confirmation to them.

## Old Evidence and Counterfactual Confirmation

A harder problem: suppose `E` is already known when `H` is proposed — as when Einstein's general relativity was proposed and the anomalous precession of Mercury's perihelion was already known. Since `P(E) = 1` (we know `E` is true), Bayes' rule gives:

    P(H | E) = P(H) · P(E | H) / P(E) = P(H)

No confirmation. But intuitively, the fact that GR explains Mercury's precession is strong evidence for it. This is the problem of old evidence.

The standard response: confirmation should be evaluated counterfactually. How much would `E` confirm `H` if we did not already know `E`? This requires a hypothetical prior that sets aside knowledge of `E` and asks what the probability update would have been. It is technically awkward but conceptually sound.

## The Relationship to Kolmogorov Complexity

Bayesian confirmation theory asks: how does `P(H)` change given `E`? Solomonoff induction answers the question of what `P(H)` should be in the first place: it should be `2^{-K(H)}`. With this prior, confirmation theory becomes fully objective. Two scientists who disagree about confirmation of `H` by `E` are either disagreeing about the likelihood `P(E | H)` — an empirical question — or about the prior — which Solomonoff fixes. There is no residual subjective element.

This is the culmination of the logical positivist programme. Carnap spent his career trying to construct an inductive logic — a formal system that would determine the degree of confirmation of any hypothesis by any evidence. He never succeeded, because he had no principled account of the prior. Solomonoff's prior completes the programme he started.

## Bayesian Confirmation and the Movements Before It

Every movement in this directory was responding to Hume's problem. Bayesian confirmation theory is the most complete response:

- It keeps the inductivist insight that evidence matters and accumulates.
- It answers Hume by replacing certainty with degrees of belief and showing that rational inference is possible without deductive justification.
- It implements Popper's insight that falsification is stronger than confirmation — a falsifying observation produces a large negative update, while a confirming observation produces a small positive one.
- It rationally reconstructs Kuhn's paradigm shifts as large-scale prior updates when accumulated anomalies drive the posterior below the threshold for a competitor.
- It validates Lakatos's distinction between progressive and degenerating programmes as a distinction between programmes with increasing and decreasing marginal likelihood.
- It dissolves Feyerabend's "anything goes" into the correct claim that methodological rules are probabilistic guidelines, not deductive requirements — and that the correct rule is always: update by Bayes with the Kolmogorov prior.