# Popper's Corroboration Is Bayesian Updating Without the Prior

## Popper's Problem

Popper wanted to characterize scientific rationality without using induction. He was convinced — correctly — that induction cannot be logically justified. But he also wanted to say that science is rational: a theory that has survived many severe tests is in better standing than one that has not. He called this "corroboration."

The problem: corroboration looks like a form of inductive support. A theory corroborated by many tests seems more likely to be true than one with few tests. If Popper admitted this, he was using induction through the back door.

Popper's response: corroboration is not a probability. It is not a measure of how likely the theory is to be true. It is a record of past performance, with no implications for future performance. A highly corroborated theory is not probably true — it has merely not yet been falsified.

This left Popper unable to explain why scientists and engineers should rely on corroborated theories. If corroboration says nothing about future performance, why build bridges with Newtonian mechanics?

## What Corroboration Actually Computes

Define the degree of corroboration of H by evidence E as Popper did, following his 1954 formalization:

    C(H, E) = [P(E|H) - P(E)] / [P(E|H) - P(E·H) + P(E)]

This is a normalized likelihood ratio — a measure of how much more probable E is under H than under the background probability of E. It is purely a function of likelihoods. It does not involve the prior P(H).

In Bayesian terms, this is the update factor: the component of the posterior update that comes from the likelihood, separated from the prior. Bayes' rule says:

    P(H|E) ∝ P(E|H) · P(H)

Popper's corroboration measure is P(E|H) / P(E) — the likelihood ratio, the Bayesian update factor — without the P(H) term.

Popper was computing exactly half of the Bayesian update. The half he refused to compute was the prior.

## Why Popper Refused the Prior

Popper rejected the prior because he rejected subjective probability. If P(H) is a degree of belief — something in the mind of the scientist — then science becomes subjective, relative to whoever is doing the believing. Different scientists with different priors would reach different conclusions from the same evidence. Popper found this unacceptable.

He was right to find it unacceptable. He was wrong to conclude that the prior must therefore be abandoned. The Solomonoff prior is not subjective: it is 2^{-K(H)}, a property of the hypothesis itself, invariant across observers up to a fixed constant. With this prior, the posterior is as objective as the likelihood.

Popper's corroboration + the Solomonoff prior = the Bayesian posterior. The posterior is the rational degree of belief in H given E. It is what Popper was looking for — an objective, principled measure of how well a theory has done — and it is exactly what his corroboration measure would have been if he had multiplied by the prior he refused to use.

## The Resolution

Popper was right that:
- Induction cannot be logically justified (Hume's point, which Popper accepted completely).
- The likelihood — how well the theory predicted the data — is the central quantity in scientific evaluation.
- A theory that makes bold, risky predictions and survives them is in better standing than one that makes weak, safe predictions.

He was wrong that:
- Corroboration has no implications for future performance. Under the Solomonoff prior, high posterior probability (= high corroboration × prior) does have implications for future performance, provably.
- The prior must be subjective. The Solomonoff prior is objective.
- Science does not involve induction. Science involves induction in exactly the sense Solomonoff formalizes: updating a prior weighted by description length with observed likelihoods. The justification Popper demanded for induction cannot be a deductive proof — but it can be an optimality proof, and that proof exists.

Popper's falsificationism is the skeleton of the correct theory. The Bayesian/Kolmogorov framework is the complete theory.