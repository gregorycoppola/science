# Bayes

The word "Bayesian" is one of the most overloaded terms in science. It appears in statistics, philosophy, neuroscience, machine learning, and everyday reasoning — and it means something subtly different in each context, though all the meanings share a common root.

This directory unpacks each meaning separately, then shows how they fit together.

## The Common Root

All uses of "Bayesian" trace back to a single equation:

    P(H | D) = P(D | H) · P(H) / P(D)

This is Bayes' rule, proved by Thomas Bayes (posthumously, 1763) and independently by Pierre-Simon Laplace. The equation itself is not controversial — it is a theorem of probability theory, true by definition of conditional probability. What is controversial is what it means, when it applies, and how to use it.

## The Meanings

**Bayesian inference** (`INFERENCE.md`) — using Bayes' rule to update a probability distribution over hypotheses given observed data. The mechanics: what prior, likelihood, and posterior mean, and how to compute with them.

**Bayesian epistemology** (`EPISTEMOLOGY.md`) — the philosophical claim that probabilities are *degrees of rational belief*, not frequencies. The Bayesian says: any rational agent has a prior over hypotheses, updates by Bayes' rule, and this is what it means to reason correctly.

**Frequentism** (`FREQUENTISM.md`) — the opposing view: probabilities are limiting frequencies of repeatable events, not degrees of belief. The debate between Bayesians and frequentists is one of the longest-running in the philosophy of statistics. Both sides are partly right.

**Bayesian networks** (`NETWORKS.md`) — a formalism for representing probability distributions over many variables using graphs. Nodes are variables, edges are dependencies, and inference is performed by belief propagation on the graph. This is the computational face of Bayesian reasoning.

**The Bayesian brain** (`BRAIN.md`) — the hypothesis that the brain is a Bayesian inference engine: it maintains a probabilistic model of the world, updates it with sensory data, and generates predictions. This is the dominant framework in theoretical neuroscience.

**Bayesian learning** (`LEARNING.md`) — in machine learning, placing a prior over model parameters and computing the posterior given training data. This connects to regularization, generalization, and the Solomonoff prior.

## How They Fit Together

The philosophical claim (epistemology) justifies the inference procedure (inference). The inference procedure, applied to graphical models, gives you Bayesian networks. Applied to the brain, it gives you predictive coding. Applied to model parameters, it gives you Bayesian learning. Applied to all computable hypotheses with the Kolmogorov prior, it gives you Solomonoff induction — the objective function for science described in `../objective_functions/`.

The word "Bayesian" names a single coherent worldview about what reasoning is, expressed at different levels of abstraction.