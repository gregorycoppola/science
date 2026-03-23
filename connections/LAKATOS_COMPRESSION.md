# Lakatos's Progressive vs. Degenerating Is Compression Growth vs. Decay

## Lakatos's Criterion

Lakatos defined the distinction between progressive and degenerating research programmes in terms of theoretical and empirical progress:

A research programme is **progressive** if successive modifications to the protective belt:
1. Have excess empirical content over the predecessor — they predict new facts, not just account for known ones.
2. Some of those new predictions are confirmed.

A research programme is **degenerating** if successive modifications:
1. Only explain anomalies already known — they are ad hoc responses to existing problems.
2. Make no new predictions that are subsequently confirmed.

This criterion is qualitative. Lakatos could not give a precise algorithm for computing whether a programme was progressive or degenerating — he acknowledged that the evaluation required judgment and could only be made in retrospect over a significant stretch of history.

## The MDL Translation

Let H_t be the best theory in a research programme at time t, and D_t be all data available at time t.

The programme is **progressive** at step t if:

    [L(H_{t+1}) + L(D_t | H_{t+1})] < [L(H_t) + L(D_t | H_t)]

and moreover:

    [L(H_{t+1}) + L(D_{t+1} | H_{t+1})] < [L(H_t) + L(D_{t+1} | H_t)]

where D_{t+1} includes new observations not available when H_{t+1} was proposed. The modification decreases total description length on old data AND on new data not used in constructing the modification.

The programme is **degenerating** if the modification decreases description length on D_t (it was designed to handle known anomalies) but not on D_{t+1} (it makes no new successful predictions). The modification overfits to known anomalies — it decreases L(D_t | H) at the cost of increasing L(H) by enough that future compression is no better.

This is exactly the overfitting criterion from machine learning: a model that improves training loss but not test loss is overfitting. A degenerating research programme is overfitting to the known data.

## Making Lakatos Computable

Lakatos's criterion required historical judgment: only over a sufficiently long stretch of history could you tell whether a programme was progressive or degenerating. The MDL translation suggests when you can make the judgment earlier.

At each step, compute:
- The increase in L(H) from the new modification — the complexity cost.
- The decrease in L(D|H) on known data — the fit improvement.
- The decrease in L(D|H) on held-out or predicted data — the genuine compression.

If the complexity cost is high and the genuine compression on new data is zero, the modification is degenerating — regardless of how well it explains the known anomalies it was designed to address.

This makes Lakatos's criterion computable in principle — given a formal language for expressing the hypotheses and a coding scheme for the data. In practice, research programmes are expressed in natural scientific language, not formal code, so the computation is approximate. But the principle is precise: track description length on new data, not just on the data the theory was fitted to.

## The Newtonian Example, Revisited

Newton's programme was progressive through the 18th and early 19th centuries. Each new application — tides, perturbations of planetary orbits, the shape of the Earth — required modifications (specification of mass distributions, treatment of non-point objects) that increased L(H) slightly but decreased L(D|H) substantially on genuinely new observations. The ratio of compression gain to complexity cost was strongly positive.

The first sign of degeneration: the anomalous precession of Mercury's perihelion. Newtonian modifications to explain it — proposed modifications to the inverse-square law, hypothetical intra-Mercurial planets — increased L(H) substantially without predicting anything new. The programme was consuming complexity without producing compression.

General relativity arrived and explained Mercury's precession as a consequence of a framework that also predicted new phenomena: the deflection of light, gravitational redshift, gravitational waves. Its initial L(H) was high — the mathematical apparatus of differential geometry is complex — but its L(D|H) on genuinely new observations was dramatically lower. The MDL crossover was decisive.

## The Payoff

The MDL translation of Lakatos does two things:

First, it makes the criterion precise. "Progressive" and "degenerating" are no longer qualitative judgments — they are inequalities involving description lengths. The criterion is still difficult to compute in practice, but it is no longer conceptually vague.

Second, it connects Lakatos to the full Bayesian/Kolmogorov framework. A progressive research programme is one with increasing marginal likelihood on new data. A degenerating one has decreasing marginal likelihood. The Bayesian posterior automatically favors progressive programmes and penalizes degenerating ones — Lakatos's methodology is implicit in any coherent Bayesian inference over competing hypothesis classes.