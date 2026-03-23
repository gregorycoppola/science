# Solomonoff Induction: Kolmogorov Complexity as a Prior

## The Prior Problem, Restated

Bayesian inference is provably the correct framework for updating beliefs given evidence. The update rule — `P(H | D) ∝ P(D | H) · P(H)` — is not controversial. What is controversial is where `P(H)` comes from.

If you choose the prior arbitrarily, you can bias the posterior toward any conclusion you want. Two scientists with different priors can look at the same data and reach opposite conclusions, each reasoning correctly by their own lights. This is the prior problem, and it is a real problem.

Solomonoff's answer (1964): the prior is not arbitrary. There is a unique, principled, universal choice — one that is not relative to any particular scientist, culture, or domain.

## The Solomonoff Prior

Assign to each hypothesis `H` (a computable string) the prior:

    M(H) = sum over all programs p that output H of  2^{-|p|}

This is the probability that a program drawn uniformly at random from all binary strings produces output `H`. It weights each hypothesis by the total "probability mass" of all programs that generate it, with shorter programs contributing exponentially more mass.

The dominant term in `M(H)` is `2^{-K(H)}` — the contribution from the shortest program. So up to lower-order terms:

    M(H) ≈ 2^{-K(H)}

Simpler hypotheses — those with shorter generators — receive exponentially higher prior probability. This is Occam's Razor, not assumed but derived from the structure of computation.

## Why This Prior Is Universal

The Solomonoff prior `M` is *universal* in a technical sense: for any computable probability distribution `P` over strings, there exists a constant `c_P` such that:

    M(x) ≥ c_P · P(x)   for all strings x

`M` dominates every computable distribution up to a multiplicative constant. No computable prior assigns more probability to any hypothesis than `M` does, up to a fixed factor.

This means: if a hypothesis is probable under *any* computable prior — any prior that can be expressed as an algorithm — it is also probable under `M`. The Solomonoff prior does not miss anything that any other computable prior would assign probability to. It is the *largest* computable semimeasure, the most generous prior consistent with the laws of computation.

## Solomonoff Induction

Solomonoff induction is Bayesian inference with `M` as the prior. Given a sequence of observations `x_1, x_2, ..., x_n`, the predictive distribution over the next observation `x_{n+1}` is:

    P(x_{n+1} | x_1, ..., x_n) = M(x_{n+1} | x_1, ..., x_n)

This predictor has a remarkable convergence property: for any computable environment — any computable process generating the data — Solomonoff induction converges to the true predictive distribution. The total squared prediction error is bounded. The predictor learns to predict correctly, no matter what computable process is generating the data, as long as enough data is available.

No other prediction strategy can consistently outperform Solomonoff induction across all computable environments. It is, in a precise sense, the best possible predictor.

## What This Means for Science

Science is prediction. A scientific theory earns its keep by making accurate predictions about observations not yet made. Solomonoff induction tells us the optimal way to do this: maintain a prior weighted by program length, update by Bayes' rule, predict using the posterior.

Real science approximates this in several ways:

- Theories are proposed as short descriptions of large bodies of data — approximating `K(H)`.
- Models are selected using AIC, BIC, cross-validation, or MDL — all approximating the MDL objective.
- Peer review and replication are imperfect approximations to Bayesian updating with a community prior.

The gap between real science and Solomonoff induction is a gap of computational tractability, not of principle. Solomonoff induction is the ideal that real science is approximating.

## The Uncomputability, Again

Solomonoff induction is not computable — it requires computing `M(x)`, which requires knowing `K(x)`. So it cannot be implemented directly.

But this does not make it useless as a target. It defines what a perfect scientific reasoner would do. Computable methods — MDL, cross-validation, Bayesian model selection with parametric priors — are approximations to this ideal. The closer they approximate it, the better they work. Knowing the ideal tells you the direction in which to improve your approximations.