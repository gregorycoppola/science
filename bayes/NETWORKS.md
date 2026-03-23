# Bayesian Networks: The Computational Face

## From Inference to Computation

Bayesian inference tells you how to update a distribution over hypotheses given data. But real problems involve many variables — hundreds, thousands, millions — and maintaining a full joint distribution over all of them is computationally impossible. The joint distribution over `n` binary variables has `2^n` entries.

Bayesian networks are the solution: a way to represent a joint distribution compactly by exploiting conditional independence structure, and a set of algorithms for doing inference efficiently on that representation.

## The Representation

A Bayesian network is a directed acyclic graph (DAG) where:

- Each node is a random variable.
- Each edge `A → B` represents a direct probabilistic influence of `A` on `B`.
- Each node `X` has a conditional probability table (CPT) giving `P(X | parents(X))`.

The joint distribution over all variables factors as:

    P(X_1, ..., X_n) = product_i P(X_i | parents(X_i))

This is the key: instead of storing `2^n` numbers, you store one CPT per node, each of size proportional to `2^{number of parents}`. If the graph is sparse — few edges, few parents per node — the representation is exponentially more compact than the full joint.

## Conditional Independence

The factorization is justified by conditional independence. In a Bayesian network, a variable `X` is conditionally independent of all non-descendants, given its parents. This is the Markov condition.

Conditional independence is not an assumption imposed on the data — it is a structural claim about the generative process. If `A → C ← B` (a "collider"), then `A` and `B` are independent before observing `C`, but become dependent after. This counterintuitive fact (explaining away) is one of the key insights Bayesian networks make explicit.

## Belief Propagation

Given a Bayesian network, how do you compute posterior probabilities efficiently?

Belief propagation (BP) is the answer for tree-structured graphs. Messages pass between neighboring nodes: each node collects messages from its neighbors, multiplies them with its local CPT, and sends updated messages back. After one full pass, every node has the correct marginal posterior.

For networks with cycles, exact inference is NP-hard in general — but approximate algorithms (loopy BP, variational methods, MCMC) work well in practice for many real networks.

The connection to the `shannon` paper: transformers implement exact BP on a specific factor graph. The attention mechanism computes AND-type joint beliefs over query-key pairs; the FFN computes OR-type disjunctive updates. The residual stream is the shared message-passing bus. Bayesian networks are not just an analogy for transformers — they are the precise mathematical object that transformers instantiate.

## Factor Graphs

A factor graph is a bipartite graph with two types of nodes: variable nodes and factor nodes. Each factor node represents a function over its neighboring variables — typically a conditional probability table.

Factor graphs are more general than Bayesian networks: any Bayesian network can be converted to a factor graph, but factor graphs can also represent undirected models (Markov random fields) and other structures. Belief propagation on factor graphs is the unified algorithm that covers all these cases.

## What Bayesian Networks Are Good For

**Causal reasoning**: if the edges represent causal relationships, you can use the network to reason about interventions (do-calculus) — what happens if you force a variable to take a particular value, rather than just observing it. Observational inference and causal inference are distinct, and Bayesian networks make the distinction precise.

**Diagnosis**: medical diagnosis systems (early expert systems like MYCIN, modern clinical decision support) are often Bayesian networks. Symptoms are observed variables; diseases are hidden variables. BP computes the posterior probability of each disease given the observed symptoms.

**Generative models**: a Bayesian network defines a generative process — a way to sample synthetic data. This is the basis of variational autoencoders, diffusion models, and other generative ML architectures, all of which can be viewed as learning the parameters of a Bayesian network.

**Structure learning**: given data, you can learn the graph structure itself — which variables are directly connected, which are independent. This is Bayesian structure learning, and it is one of the main tools in causal discovery from observational data.