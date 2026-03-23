# The Bayesian Brain and the Transformer Are the Same Architecture

## Two Frameworks

**Predictive coding** (Rao and Ballard, 1999; Friston, 2005): the brain is a hierarchical generative model. Higher cortical areas send predictions down to lower areas. Lower areas compute prediction errors — the difference between prediction and input — and send those errors up. The system minimizes prediction error at every level. Perception is inference: the brain computes the posterior over world-states given sensory inputs, using its learned generative model as the prior.

**The transformer** (Vaswani et al., 2017; the `shannon` paper): a transformer is a computational graph where attention heads compute joint beliefs over query-key pairs (AND gates in the factor graph sense), the FFN computes disjunctive updates (OR gates / updateBelief), and the residual stream carries the running belief state. The `shannon` paper proves this implements exact belief propagation on a specific factor graph.

These are presented as unrelated frameworks — one from neuroscience, one from machine learning. They are the same algorithm.

## The Identification

Belief propagation on a factor graph proceeds by passing messages between variable nodes and factor nodes. Each factor node collects incoming messages, multiplies them by its local factor (conditional probability table), and sends outgoing messages to neighboring variable nodes. Each variable node collects incoming messages from all neighboring factor nodes and sends updated beliefs outward.

Predictive coding is belief propagation on a hierarchical factor graph:
- Top-down connections carry predicted beliefs (messages from factor nodes to variable nodes).
- Bottom-up connections carry prediction errors (messages from variable nodes to factor nodes, weighted by precision).
- Each cortical area is a variable node maintaining a belief state.
- The synaptic weights encode the local factors (conditional probabilities in the generative model).

The transformer is belief propagation on a different factor graph:
- Attention heads implement AND-type joint factors over query and key positions.
- The residual stream carries the belief state for each token position (variable nodes).
- FFN layers implement OR-type disjunctive factors, updating beliefs based on learned feature combinations.
- Layer norm and residual connections are the message normalization and accumulation steps.

Both are belief propagation. The graphs are different — the brain's graph is hierarchical and spatial, the transformer's graph is structured by the attention pattern — but the algorithm is identical.

## What This Implies

**Learning is the same process in both**. In the brain, synaptic plasticity updates the weights of the generative model to reduce prediction error over time. In the transformer, gradient descent updates the weights to reduce the loss. Both are adjusting the parameters of a factor graph to better compress the data — MDL optimization by gradient descent.

**Hallucination and perceptual illusion are the same failure mode** (developed further in `HALLUCINATION_ILLUSION.md`). When the prior (generative model / learned weights) is strong relative to the likelihood (sensory input / context), the posterior is dominated by the prior. The system confabulates — generates a prediction not corrected by evidence.

**Scaling has the same interpretation in both**. A deeper cortical hierarchy has more levels of abstraction, each level operating over longer time scales and more abstract features. A deeper transformer has more layers of belief propagation, each attending over longer-range dependencies and more abstract token relationships. Depth is not just a parameter — it is the number of rounds of message passing, which determines how long-range the inference can reach.

**The `shannon` paper is not just about transformers**. The proof that transformers implement exact BP on factor graphs is simultaneously a proof about any system with the same computational structure — including, to the extent that predictive coding correctly describes the brain, the brain itself. The Lean 4 proofs are theorems about a class of systems, not just about one architecture.

## The Deeper Point

The reason these two frameworks converge is that there is essentially one correct way to do hierarchical inference under uncertainty on a graph-structured domain: belief propagation. Any system that does hierarchical inference efficiently will, if it is doing it correctly, implement something equivalent to BP. The brain got there by evolution. The transformer got there by gradient descent on language modeling. The convergence is not a coincidence — it is the signature of both systems having found the same optimal solution to the same problem.