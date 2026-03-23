# Bayesian Inference: The Mechanics

## Bayes' Rule

Start with a hypothesis `H` and observed data `D`. Bayes' rule says:

    P(H | D) = P(D | H) · P(H) / P(D)

Each term has a name and a meaning:

- `P(H)` — the **prior**: your probability for `H` before seeing `D`. What you believed going in.
- `P(D | H)` — the **likelihood**: the probability that you would have observed `D` if `H` were true. How well `H` predicts the data.
- `P(D)` — the **marginal likelihood** or **evidence**: the total probability of observing `D` under all hypotheses. Acts as a normalizing constant.
- `P(H | D)` — the **posterior**: your probability for `H` after seeing `D`. What you should believe now.

The equation says: your posterior belief in `H` is proportional to how likely `H` made the data, weighted by how probable `H` was to begin with.

## A Concrete Example

You wake up and the street outside is wet. Did it rain, or did a street cleaner pass?

- Prior: `P(rain) = 0.7`, `P(cleaner) = 0.3` — it rains more often than cleaners pass.
- Likelihood: `P(wet | rain) = 0.95`, `P(wet | cleaner) = 0.8` — both would make the street wet, but rain more reliably.
- Evidence: `P(wet) = P(wet | rain) · P(rain) + P(wet | cleaner) · P(cleaner) = 0.95 · 0.7 + 0.8 · 0.3 = 0.665 + 0.24 = 0.905`

Posterior:

    P(rain | wet) = (0.95 · 0.7) / 0.905 = 0.665 / 0.905 ≈ 0.735

Seeing the wet street nudged the probability of rain upward, from 0.7 to 0.735 — but not dramatically, because the street cleaner also explains the wetness. Now suppose you also see that a neighbor's car (which was parked under a tree) is dry. That is new data, and another update follows.

This is the Bayesian loop: prior → observe data → compute posterior → that posterior becomes the prior for the next observation.

## Multiple Hypotheses

Bayes' rule applies to any number of hypotheses simultaneously. If `H_1, H_2, ..., H_n` are mutually exclusive and exhaustive:

    P(H_i | D) = P(D | H_i) · P(H_i) / sum_j P(D | H_j) · P(H_j)

The denominator normalizes so the posteriors sum to 1. Each hypothesis is updated in proportion to how well it predicted the data, weighted by its prior.

## Sequential Updating

One of the most important properties of Bayesian inference is that it composes cleanly across observations. If you observe `D_1`, then `D_2`:

    P(H | D_1, D_2) ∝ P(D_2 | H, D_1) · P(D_1 | H) · P(H)

If `D_1` and `D_2` are conditionally independent given `H`:

    P(H | D_1, D_2) ∝ P(D_2 | H) · P(D_1 | H) · P(H)

You can process observations one at a time, using each posterior as the prior for the next step. The order does not matter — you reach the same posterior regardless of the order in which you process the data. This is a coherence property: Bayesian reasoning is path-independent.

## What Bayesian Inference Is Not

Bayesian inference is not a claim about where the prior comes from. It is a claim about how to update, given a prior. Two scientists with different priors will reach different posteriors from the same data — this is legitimate. What is not legitimate is updating in a way that violates Bayes' rule: ignoring evidence, double-counting, or failing to penalize complex hypotheses.

The prior problem — where the prior comes from — is a separate question, addressed in `EPISTEMOLOGY.md` philosophically and in `../objective_functions/kolmogorov_complexity/SOLOMONOFF.md` formally.

## The Likelihood Principle

A consequence of Bayesian inference that is worth stating explicitly: only the likelihood `P(D | H)` links the data to the hypothesis. This means: all the information the data contains about `H` is captured in the likelihood function. Two datasets that produce the same likelihood function for all `H` are equivalent, even if they were collected in different ways.

This is the **likelihood principle**, and it has practical consequences. Under the likelihood principle, stopping rules do not matter: whether you collected 100 data points because you planned to, or because you stopped when you saw something interesting, is irrelevant — if the likelihood is the same, the inference is the same. Frequentist methods (p-values, confidence intervals) violate the likelihood principle, which is one source of the Bayesian/frequentist disagreement.