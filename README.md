# science

An "objective function" for science — grounding scientific progress in the Bayesian/Kolmogorov framework and connecting it to modern verification protocols and AutoResearch.

---

## The Problem

Science has always had an informal objective: find true, useful, general explanations of reality. But "informal" is the problem. Without a *formal* objective function, we have no rigorous way to:

- Compare two competing theories
- Decide when a new claim has been "verified"
- Automate or semi-automate the research loop
- Aggregate contributions from untrusted distributed sources

This is not just a philosophical puzzle. It is an immediate engineering problem. Karpathy's AutoResearch project (discussed on the No Priors podcast with Sarah Guo, March 2026) proposes a closed-loop system where AI agents autonomously run experiments, train models, and optimize — the key insight being that *finding a good commit is hard, but verifying one is cheap*. The asymmetry between search and verification is central to everything that follows.

---

## Etymology: What "Objective" Actually Means

The word *objective* comes from Medieval Latin *objectivus*, from *objectum* — "that which is thrown before (the mind)." The Latin root is *ob-* ("against, before") + *iacere* ("to throw"). So literally: *that which is placed in front of you as a target*.

The word had an interesting inversion in history. In the 1600s, "objective" meant *as perceived by the mind* — the phenomenal, the represented. By the 1700s, under influence from Kant and German philosophy, it shifted to mean *independent of the mind* — the real, the external. The connecting notion, from Merriam-Webster: *"considered in relation to its own nature."*

So an *objective* objective function is one that is:

1. **Placed before you as a target** (the goal-sense)
2. **Independent of any particular observer** (the epistemological sense)
3. **Grounded in the nature of the thing itself** (the Kantian sense)

All three of these senses are captured by the Bayesian/Kolmogorov framework.

---

## The Objective Function: Bayes + Kolmogorov

The claim of this repo is that science already has an objective function — it just hasn't been written down cleanly. It is:

    minimize  E[K(H)] - log P(D | H)

where:

- `H` is a hypothesis (a program, a theory, a model)
- `K(H)` is the Kolmogorov complexity of `H` — the length of the shortest program that describes it
- `P(D | H)` is the likelihood — how well `H` predicts the observed data `D`

This is the **Minimum Description Length (MDL)** principle, which is the computable approximation to Solomonoff induction.

Unpacked:

- **Bayesian reasoning** gives us the update rule: `P(H | D) ∝ P(D | H) · P(H)`. It is a provably optimal framework for belief revision given evidence.
- **Kolmogorov/Solomonoff** gives us the prior: `P(H) ∝ 2^{-K(H)}`. Simpler programs — shorter theories — get higher prior probability. This is Occam's Razor *derived*, not assumed.
- Together they define an objective function that is **observer-independent** (the prior is universal up to a constant independent of any particular mind) and **grounded in the nature of the object** (the complexity of the hypothesis itself).

This is what we mean by calling it an *objective* objective function. The word earns both of its meanings simultaneously.

---

## The Verification Problem

The objective function above defines what science *is optimizing*, but it does not say how to *verify* that a new submission advances it. This is Karpathy's core question in AutoResearch, and it is also the question the mathematics community is facing as large Lean proofs are dropped on it by unknown or AI sources.

The verification problem has two components:

**1. Algorithmic verification**

For certain domains, verification is cheap and automated:

- **Formal proof checking**: Lean 4, Coq, Isabelle. A claimed theorem either type-checks or it doesn't. This is O(n) in proof length, not NP-hard. The checker does not need to trust the prover.
- **Empirical reproduction**: given code + weights + data, rerun the experiment. Does the loss curve match? Do the metrics reproduce?
- **Unit tests / reward signals**: for code, does the program pass the test suite? Karpathy's AutoResearch loop uses exactly this — the reward signal is the verifier.
- **Compression-based verification**: does the proposed theory actually compress the data better than the prior best theory? MDL makes this a number.

**2. Human/community protocols**

For claims that are not yet in the verifiable domain, or where automated verification is too expensive, community protocols matter:

- **Challenge-response**: a proposer must answer adversarial questions about their claim. This is the informal norm at academic seminars; it can be formalized as a protocol (e.g., interactive proof systems from complexity theory — IP = PSPACE).
- **Replication markets**: prediction markets on whether a result replicates, with incentives tied to doing the replication work.
- **Distributed Lean formalization**: analogous to Karpathy's SETI@Home vision — a community of agents (human + AI) that collectively formalize informal proofs, turning them into machine-checkable objects.
- **Citation graph / Bayesian reputation**: weight new claims by the track record (posterior) of the source, updated by whether past claims survived verification.

The key principle: **verification should be cheaper than discovery.** If it isn't, the protocol is wrong.

---

## The AutoResearch Loop

Karpathy's AutoResearch system instantiates a fragment of this objective function. Per the No Priors podcast (March 2026), the system:

- Runs many parallel agent attempts (the search)
- Verifies each attempt against a cheap reward signal (the verifier)
- Keeps the improvements, discards the failures
- Is designed to accept contributions from *untrusted* distributed sources — the key word being *untrusted*

The untrusted-source design is critical. It mirrors how Kolmogorov complexity works: you do not need to trust the *source* of a short program — you just need to verify that it is short and that it predicts the data. The source is irrelevant. The object speaks for itself.

This is the philosophical core of the Bayesian/Kolmogorov framework applied to institutions: **trust the math, not the messenger.**

---

## Connection to Transformers as Bayesian Networks

The `shannon` paper proves that transformers implement exact belief propagation on factor graphs. This connects to the objective function in a specific way:

- Gradient descent on a transformer is implicitly searching for weights that minimize description length of the training data
- The AND/OR structure (attention heads as AND gates, FFN sigmoid as OR/updateBelief) is the architecture that belief propagation *requires* for exact inference on factor graphs
- The empirical result — gradient descent recovers BP weights to three decimal places — means transformers are not just *inspired by* Bayesian inference; they *implement* it

So a transformer trained on scientific text is, in a precise sense, approximating the Solomonoff prior over the hypotheses expressed in that text. AutoResearch using a transformer as its backbone is therefore not just a heuristic optimization loop — it is an approximation to the formal Bayesian/Kolmogorov objective function for science.

---

## Open Questions

- Can Kolmogorov complexity be approximated well enough (e.g., via neural compression) to make the objective function *practically* computable?
- What is the right formalization of "untrusted source" verification in the language of interactive proof systems?
- Can Lean 4 proof checking be made fast enough to serve as the reward signal in an AutoResearch loop?
- Is the Bayesian update rule the *only* update rule consistent with the Kolmogorov prior, or are there alternatives?

---

## See Also

- `shannon` — the Transformers are Bayesian Networks paper
- `sigmoid-transformer-lean` — Lean 4 machine-verified proofs
- `bayes-learner` — empirical confirmation of BP weight recovery
- Karpathy, AutoResearch repo (github.com/karpathy/autoresearch)
- Solomonoff (1964), "A formal theory of inductive inference"
- Rissanen (1978), "Modeling by shortest data description" (MDL)
- Goldwasser, Micali, Rackoff (1989), "The knowledge complexity of interactive proof systems"