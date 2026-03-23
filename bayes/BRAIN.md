# The Bayesian Brain: Perception as Inference

## The Hypothesis

The most influential framework in theoretical neuroscience over the past thirty years is the hypothesis that the brain is a Bayesian inference engine. On this view:

- The brain maintains an internal probabilistic model of the world.
- Sensory inputs are noisy, ambiguous evidence about the state of the world.
- Perception is the process of computing the posterior distribution over world-states given sensory inputs — Bayesian inference.
- Action is the process of selecting behaviors that bring the world into alignment with the brain's predictions.

This is called the **predictive coding** framework (Rao and Ballard, 1999) or, in its most general form, the **free energy principle** (Friston, 2006).

## Why the Brain Needs to Be Bayesian

The retinal image is deeply ambiguous. The same pattern of light on the retina is consistent with infinitely many three-dimensional scenes. The brain cannot recover the true scene from the image alone — it needs prior knowledge about what scenes are likely, what objects tend to look like, how light behaves.

This is an inference problem, and Bayesian inference is the optimal solution. The brain's priors — built up from evolution and experience — constrain the interpretation. Perception is the result of combining the sensory likelihood with the prior, yielding a posterior estimate of the scene.

The evidence that the brain does something like this is substantial:

- **Perceptual illusions** are cases where the prior dominates a weak likelihood. The brain "hallucinates" the most probable interpretation of ambiguous input, even when that interpretation is wrong.
- **The hollow mask illusion**: a hollow face mask looks convex because the prior for convex faces is so strong. The brain refuses to believe the correct interpretation.
- **Multisensory integration**: when vision and touch give conflicting information about object size, the brain combines them in a way that is close to Bayes-optimal, weighting each modality by its reliability.
- **Motor control**: the brain's control of movement can be modeled as Bayesian filtering — combining noisy proprioceptive feedback with a forward model of the body's dynamics to estimate current state.

## Predictive Coding

The predictive coding architecture makes the Bayesian brain hypothesis concrete and neurally plausible.

The key idea: instead of transmitting raw sensory data up the cortical hierarchy, the brain transmits *prediction errors* — the difference between what was predicted and what was observed. Higher areas send predictions down; lower areas send errors up. The system minimizes prediction error at every level of the hierarchy.

This is efficient: if your predictions are good, most signals cancel out and very little information needs to be transmitted. Only surprises propagate. This matches the known anatomy of cortical feedback connections (top-down) and feedforward connections (bottom-up), and it matches the observation that cortical neurons respond most vigorously to unexpected stimuli.

The mathematical formulation: minimize the variational free energy, which is an upper bound on surprise (negative log evidence). This is equivalent to performing approximate Bayesian inference on a hierarchical generative model of the sensory environment.

## Hallucination as a Bayesian Phenomenon

Under predictive coding, hallucination — in both the psychiatric and the more general sense — is what happens when the prior dominates the likelihood. The brain generates predictions that are not adequately corrected by sensory evidence.

This connects to the "hallucination is a grounding problem" framing in the `shannon` paper. A language model that hallucinates is failing to adequately weight the likelihood (grounding in observed facts) relative to the prior (learned statistical patterns). The brain and the transformer are doing the same computation, and failing in the same way.

## The Free Energy Principle

Karl Friston's free energy principle (2006 onward) is the most ambitious version of the Bayesian brain hypothesis. It proposes that all living systems — not just brains — minimize free energy, where free energy is a measure of the difference between the organism's internal model and the true distribution of sensory inputs.

Minimizing free energy has two components:

- **Perception**: update the internal model to better predict current inputs (change beliefs to fit the world).
- **Action**: change the world to better match predictions (change the world to fit beliefs).

Both are ways of reducing the discrepancy between model and reality. The organism is always doing one or the other. This unifies perception, action, learning, and attention under a single principle.

The free energy principle is controversial — critics argue it is too general to be falsifiable. But as a framework for thinking about how biological systems maintain themselves in a changing environment, it has been enormously productive.