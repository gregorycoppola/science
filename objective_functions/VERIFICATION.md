# Verification: The Search/Verify Asymmetry

## The Central Asymmetry

The objective function tells you what science is optimizing. But running the optimization loop requires solving a different problem: given a proposed hypothesis `H`, how do you verify that it actually advances the objective?

The key structural fact is:

    Finding a good H is hard.  Verifying a proposed H is cheap.

This asymmetry is not incidental. It is a feature of the framework, and it is the design principle behind every good verification protocol.

In Andrej Karpathy's AutoResearch system (No Priors podcast, March 2026), the same asymmetry drives the architecture: an agent runs thousands of experimental commits searching for improvements, but verifying whether a commit actually helps requires only a single retrain and evaluation. The search is expensive; the check is cheap. This is why distributed, untrusted-source systems are possible at all — you do not need to trust who proposed `H`, you only need to run the verifier.

## Algorithmic Verification

For claims in the verifiable domain, verification can be automated.

**Formal proof checking**

If a hypothesis is expressed as a theorem with a machine-checkable proof (Lean 4, Coq, Isabelle), verification is linear in proof length. The checker does not evaluate the *source* of the proof — it checks the *object*. A proof submitted by an unknown agent is as valid as one submitted by a Fields Medalist, if it type-checks.

This is the purest instantiation of the Kolmogorov principle: trust the object, not the messenger. The proof is the hypothesis. Its validity is a property of its own structure.

**Empirical reproduction**

Given code, weights, and data, rerun the experiment. Does the reported metric reproduce? This is cheap relative to the original research cost, and it provides a binary signal: the claim either holds or it does not.

**Compression-based verification**

Does the proposed theory actually compress the data better than the previous best? MDL makes this a number. Given a fixed coding scheme, compute `L(H) + L(D | H)` for the new theory and for the incumbent. If the new value is lower, the theory advances the objective. No subjective judgment required.

**Reward signal verification**

Karpathy's AutoResearch loop uses exactly this: define a scalar reward (validation loss, benchmark accuracy, test pass rate), and accept a proposed change if and only if the reward improves. The reward function is the verifier. This works whenever the objective can be reduced to a computable scalar — which, under MDL, it can in principle always be.

## Community Protocols

Not all claims are in the verifiable domain yet. For claims that require human judgment, community protocols matter.

**Challenge-response**

A proposer must answer adversarial questions about their claim. This is the informal norm at academic seminars. It can be formalized using interactive proof systems from complexity theory: the verifier sends challenges, the prover responds, and the protocol has bounded error. The complexity-theoretic result IP = PSPACE tells us that an astonishingly large class of claims can be verified this way, even when direct checking is intractable.

**Replication markets**

Prediction markets on whether a result replicates, with payoffs tied to actually doing the replication work. This aligns incentives: the people most likely to know whether a result is real are the people best positioned to replicate it, and the market rewards them for doing so.

**Distributed formalization**

A community of agents — human and AI — that collectively formalize informal proofs and experimental results into machine-checkable form. This is the SETI@Home vision applied to verification: idle compute and human attention, distributed across a network, gradually converting the informal scientific record into a formally verified one. Each formalized result reduces the description length of the relevant corner of science.

**Bayesian reputation**

Weight new claims by the posterior track record of the source, updated by whether past claims survived verification. This is not the same as trusting the source — it is using the source's history as a prior, which Bayes' rule licenses. A source whose past claims have survived replication earns a higher prior on future claims, and vice versa. The prior can be overridden by strong evidence either way.

## The Untrusted Source Principle

The most important design principle for any verification system is:

    The verifier does not need to trust the source.

Under the Kolmogorov framework, a hypothesis is evaluated on its length and its predictive accuracy — properties of the object itself. The identity, credentials, or intentions of whoever proposed it are irrelevant to its truth.

This is not just a philosophical point. It is an engineering requirement for any distributed AutoResearch system. If verification requires trusting the source, the system cannot scale — you cannot verify the identity or intent of every agent in a distributed network. But if verification is a property of the object (does the proof type-check? does the loss go down? does the description length shrink?), then the system can accept submissions from arbitrary untrusted sources and remain sound.

The math is the trust anchor.