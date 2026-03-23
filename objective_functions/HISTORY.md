# History: How Science Has Approximated This Objective

Science did not wait for Kolmogorov or Solomonoff to start doing science. It has been approximating the Bayesian/Kolmogorov objective function informally for centuries. Understanding how the informal practice maps onto the formal framework clarifies both sides.

## Ptolemy to Copernicus: Complexity Penalty in Action

The Ptolemaic system — Earth at the center, planets on epicycles — predicted astronomical observations reasonably well. But each unexplained residual required adding another epicycle. The description length of the hypothesis kept growing.

Copernicus, and then Kepler, proposed a heliocentric model that predicted the same observations with far fewer parameters. The description length dropped dramatically. Under MDL, the Copernican model was the correct choice even before it achieved strictly better predictive accuracy, because the complexity penalty on Ptolemy had grown so large.

The scientists of the time did not use this language. But the argument they actually made — *this model is simpler and fits the data just as well* — is exactly the MDL argument.

## Newton: Compression as the Goal

Newton's laws compress an enormous range of phenomena — falling apples, planetary orbits, tides, projectile trajectories — into three equations plus a gravitational constant. The description length of the hypothesis is tiny. The predictive coverage is vast.

This is the clearest historical example of the Kolmogorov objective in action. Newton himself described the goal of science as finding the fewest principles that explain the most phenomena. That is a paraphrase of `minimize L(H) + L(D | H)`.

## Popper: Falsifiability as a Proxy

Karl Popper's falsifiability criterion (1934) was an attempt to demarcate science from non-science: a claim is scientific if and only if it could in principle be shown false by observation.

Under the Kolmogorov framework, falsifiability is a necessary but insufficient condition. A hypothesis that cannot be falsified has `P(D | H)` constant across all `D` — it makes no predictions, so it contributes nothing to the likelihood term. Such a hypothesis cannot lower `L(D | H)` and therefore cannot advance the objective. So Popper was right that unfalsifiable theories are scientifically empty.

But falsifiability alone does not rank two falsifiable theories against each other. MDL does: given two theories that both make predictions, the better one is the one with lower total description length `L(H) + L(D | H)`. Popper's criterion is a gate; Bayes+Kolmogorov is the objective function behind the gate.

## Kuhn: Paradigms as Local Optima

Thomas Kuhn's structure of scientific revolutions (1962) describes science as operating within paradigms — shared frameworks that define what counts as a problem and what counts as a solution — punctuated by occasional revolutions where one paradigm is replaced by another.

Under the Kolmogorov framework, a paradigm is a local optimum of the MDL objective. Normal science is gradient descent within the current local optimum: researchers accumulate anomalies (data that the current theory compresses poorly) until the description length overhead becomes large enough that a new hypothesis in a different region of hypothesis space achieves lower total description length. The revolution is a jump to a new, better local optimum.

Kuhn thought this showed science was not rational — that paradigm choice was sociologically determined. The Kolmogorov framework says the opposite: paradigm shifts are rational, and they are rational for a precise reason. The new paradigm wins because it achieves lower description length. The social process is messy, but the objective function it is approximating is well-defined.

## The Replication Crisis: Description Length Gone Wrong

The replication crisis in psychology and social science (roughly 2010–present) is a case study in what happens when the verification step is removed from the optimization loop.

The proximate cause was p-hacking: researchers tried many hypotheses and reported only the ones that achieved p < 0.05. Under MDL, this is straightforwardly wrong: the description length of a hypothesis must include the cost of the search that found it. If you tried 20 hypotheses and reported the best one, the description length of that hypothesis includes log(20) bits of search cost. Ignoring this cost produces apparent results that do not replicate, because the apparent compression of the data was illusory.

The fix — preregistration, larger samples, adversarial collaboration, direct replication — is precisely the set of practices that restore the honest MDL calculation. Preregistration fixes the hypothesis before seeing the data, so no search cost is incurred. Larger samples reduce the variance of the likelihood estimate. Adversarial collaboration and direct replication are verification protocols.

The replication crisis is not a crisis of science. It is a crisis of verification infrastructure — a failure to enforce the check that proposed hypotheses actually advance the objective.

## The Present: AutoResearch and Formal Verification

The current moment represents the first time the optimization loop can be partially automated. Karpathy's AutoResearch system closes the loop at the level of ML experiments: propose, verify, keep, repeat. Lean 4 and other proof assistants close the loop at the level of mathematical claims.

Both are applications of the same principle: make the verifier cheap, make the search parallel, trust the object not the source. The Bayesian/Kolmogorov objective function is the same as it has always been. What is new is the infrastructure to approximate it at scale.