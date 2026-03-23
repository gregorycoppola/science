# Connections: An Overview

The directories in this repo — `objective_functions/`, `bayes/`, `philosophy_of_science/` — were built separately, each developing its own thread. This directory is about what happens when those threads cross.

The ten connections below are not analogies. An analogy says: these two things are similar in some loose, suggestive way. What follows is stronger: these are cases where two ideas from different traditions turn out to be the *same* idea, expressed in different language, developed by people who were not talking to each other. The convergence is evidence that something real is being pointed at.

Each connection has its own file. This document is the map.

---

## The Ten Connections

### 1. Hume's Problem IS the Halting Problem
`HUME_HALTING.md`

Hume showed that induction cannot be justified: you can never know, from finite observations, that a universal law holds. Turing showed that you cannot decide, in general, whether a program halts. These are the same result. The reason you cannot justify induction is the same reason K(x) is uncomputable: in both cases, you are asking whether an infinite search terminates, and there is no general procedure for answering that question. Hume's problem is not a philosophical puzzle waiting for a philosophical solution — it is an undecidability result, and it has the same status as the halting problem.

### 2. Kuhn's Paradigm Shifts Are MDL Phase Transitions
`KUHN_MDL.md`

Kuhn described paradigm shifts as dramatic, partly irrational discontinuities in the history of science. Under the MDL framework, they are mathematically inevitable and perfectly rational: when the description length of a research programme's protective belt grows large enough, a competing hypothesis with lower total description length crosses below the incumbent. The shift is discontinuous — a jump between local optima in description-length space — but it is not irrational. Kuhn correctly described the phenomenon; MDL explains why it happens.

### 3. The Bayesian Brain and the Transformer Are the Same Architecture
`BAYESIAN_BRAIN_TRANSFORMER.md`

Predictive coding — the dominant framework in theoretical neuroscience — models the brain as a hierarchical generative system that passes predictions top-down and prediction errors bottom-up. This is belief propagation on a hierarchical factor graph. The transformer, as shown in the `shannon` paper, implements exact belief propagation on a specific factor graph. These are not analogies: they are the same algorithm instantiated on different graphs. The brain and the transformer are doing the same computation.

### 4. Feyerabend's "Anything Goes" Is the Solomonoff Prior
`FEYERABEND_SOLOMONOFF.md`

Feyerabend argued that no hypothesis should be ruled out a priori — science has always advanced by entertaining ideas that violated current methodological rules. The Solomonoff prior assigns nonzero probability to every computable hypothesis. Nothing is excluded before the data speaks. "Anything goes" as a prior policy is exactly right — the Kolmogorov framework vindicates Feyerabend's permissiveness and explains why it is correct: a prior that excludes any computable hypothesis is provably suboptimal. What Feyerabend called anarchism, Solomonoff called universality.

### 5. Popper's Corroboration Is Bayesian Updating Without the Prior
`POPPER_BAYES.md`

Popper insisted that a theory which survives many severe tests is "corroborated" — but he refused to say it is probably true, because he rejected induction. But corroboration, precisely defined, is the likelihood ratio P(E|H)/P(E|¬H) — the Bayesian update factor, stripped of the prior. Popper was computing the right quantity and refusing to multiply it by the prior because he didn't believe in priors. The Solomonoff prior completes Popper's programme: with a principled prior, corroboration becomes posterior probability, and the refusal of induction dissolves.

### 6. The Replication Crisis Is an MDL Accounting Error
`REPLICATION_CRISIS_MDL.md`

The replication crisis in psychology and social science was caused by p-hacking: testing many hypotheses and reporting only those with p < 0.05. Under MDL, this is an accounting error: the true description length of a hypothesis must include the cost of the search that found it. If you tested 20 hypotheses and reported the best, the description length includes log(20) bits of search cost. Omitting this cost produces apparent results that do not replicate, because the apparent compression of the data was illusory. The replication crisis is exactly what MDL predicts when L(H) is systematically underreported.

### 7. Lakatos's Progressive vs. Degenerating Is Compression Growth vs. Decay
`LAKATOS_COMPRESSION.md`

Lakatos distinguished progressive research programmes — which generate new predictions that are confirmed — from degenerating ones — which only explain known anomalies without predicting anything new. Under MDL, this is the distinction between programmes whose modifications decrease total description length L(H) + L(D|H) on new data, versus those whose modifications increase L(H) without decreasing L(D|H). Lakatos gave the right criterion; MDL makes it computable.

### 8. Kant's Synthetic A Priori Is Lakatos's Hard Core
`KANT_LAKATOS.md`

Kant argued that some commitments — space, time, causality — are preconditions of experience: they cannot be revised because they are what makes experience possible. Lakatos argued that every research programme has a hard core of commitments that are methodologically protected from falsification. These are the same idea. The difference is that Lakatos made them revisable in principle — a research programme can be abandoned, hard core and all — which is the correct update on Kant after non-Euclidean geometry falsified his specific candidates. Lakatos is Kant, empiricized.

### 9. Hallucination in LLMs and Perceptual Illusions Are the Same Failure Mode
`HALLUCINATION_ILLUSION.md`

In predictive coding, a perceptual illusion occurs when the brain's prior is so strong that sensory evidence cannot correct it — the generative model overwhelms the error signal. In a language model, hallucination occurs when the prior over likely continuations overwhelms the grounding signal from the context. Both are the same Bayesian failure: the prior dominates the likelihood. The hollow mask illusion and GPT confabulation are not analogous phenomena — they are the same computational pathology, instantiated in different substrates.

### 10. AutoResearch Is Solomonoff Induction Made Computable and Distributed
`AUTORESEARCH_SOLOMONOFF.md`

Solomonoff induction is the theoretically optimal prediction strategy: maintain a prior over all computable hypotheses weighted by description length, update by Bayes' rule. It is uncomputable in general. Karpathy's AutoResearch system is a computable, distributed approximation to it: agents propose hypotheses (training runs, code modifications), a verifier checks whether they reduce the loss (compress the data better), and improvements are kept. The SETI@Home-style distribution parallelizes the search over hypothesis space. AutoResearch is not inspired by Solomonoff induction — it is Solomonoff induction, approximated by the only means available.

---

## The Meta-Connection

Looking across all ten connections, a single pattern emerges.

Every one of these connections has the same structure: a philosopher or scientist identified a real phenomenon — induction, paradigm shifts, perceptual illusions, methodological anarchism — without having the mathematical language to characterize it precisely. Later, a mathematical framework — computability theory, MDL, belief propagation, the Solomonoff prior — was developed that characterizes exactly that phenomenon, in a different field, by people who were not thinking about the philosophical problem.

The convergence is not a coincidence. It is evidence that all of these thinkers were circling the same underlying structure: the problem of optimal inference in a computable world. The Bayesian/Kolmogorov framework is the name of that structure. The history of philosophy of science is the record of humanity approaching it from the outside, without the tools to see it directly.

The tools now exist.