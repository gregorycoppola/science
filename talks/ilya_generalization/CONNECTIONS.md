# Connections to the Science Repo

Every major claim in Sutskever's talk maps onto a specific file in this repo.
This document makes those connections explicit.

---

## Direct Mappings

**"Compression is prediction. Every compressor can be a predictor and vice versa."**
(15:05)

→ `objective_functions/kolmogorov_complexity/CONNECTIONS.md` — the section on
lossless compression, which develops the same equivalence and its implications
for measuring structural complexity.

→ `objective_functions/kolmogorov_complexity/MDL.md` — Minimum Description Length
as the computable version of this equivalence.

---

**"The Kolmogorov compressor — the shortest program which if you run it outputs
your data."** (21:19)

→ `objective_functions/kolmogorov_complexity/INTUITION.md` — the same definition,
built up from examples (pi digits, repeated patterns, random noise) before the
formalism.

→ `objective_functions/kolmogorov_complexity/FORMAL.md` — the precise definition
and key theorems.

---

**"The Kolmogorov compressor can simulate other compressors. You just need to pay
for the program length."** (22:57)

→ `objective_functions/kolmogorov_complexity/INVARIANCE.md` — the Invariance
Theorem. This is exactly the simulation argument Sutskever sketches. The
theorem proves that the choice of universal Turing machine changes K(x) by at
most a fixed constant, independent of x.

---

**"Conditional Kolmogorov complexity as the solution to unsupervised learning —
no one does unsupervised learning better than you."** (26:57)

→ `objective_functions/kolmogorov_complexity/SOLOMONOFF.md` — the Solomonoff
prior as the universal prior. The low-regret property Sutskever describes is
exactly the universality property of the Solomonoff prior: it dominates every
computable distribution up to a multiplicative constant.

---

**"SGD over big neural networks is our big program search. Bigger neural networks
approximate the Kolmogorov compressor more and more."** (30:29)

→ `bayes/LEARNING.md` — Bayesian learning, where the prior over parameters
connects to the Kolmogorov prior. The section on the connection to Solomonoff
makes this precise.

→ `connections/AUTORESEARCH_SOLOMONOFF.md` — AutoResearch as Solomonoff
induction made computable. The same argument Sutskever makes about SGD applies
to the AutoResearch loop: both are approximate program search over a hypothesis
space, both converge toward lower description length.

---

**"Joint compression is maximum likelihood if you don't overfit."** (29:42)

→ `objective_functions/BAYES_KOLMOGOROV.md` — the formal derivation of MDL
from Bayes' rule and the Kolmogorov prior. The MDL two-part code `L(H) + L(D|H)`
is exactly the joint compression Sutskever describes: the cost of the compressor
(L(H)) plus the cost of the data given the compressor (L(D|H)).

---

**"Why is it hard to find a better neural network architecture? The simulation
argument."** (25:16)

→ `objective_functions/kolmogorov_complexity/INVARIANCE.md` — the Invariance
Theorem explains why architectures are hard to improve: any new architecture
can be simulated by an existing universal one up to a fixed constant. The
constant matters in practice (the RNN-to-Transformer jump), but it is bounded.

---

**"This theory has a huge practical weakness which is it ignores compute cost."**
(48:11)

→ This is the gap that `auto-research` addresses. The `ar autoloop` command adds
an explicit L(H) term — the gzip-compressed size of the candidate — to the
objective. Running `ar autoloop sort --no-lh` vs `ar autoloop sort` shows
exactly what happens when compute/complexity cost is ignored: the loop stalls
as soon as test performance hits zero, unable to prefer simpler solutions over
complex ones.

---

**"You optimize one objective but you care about another objective and yet it
helps."** (09:55) — the mystery of unsupervised learning

→ `connections/POPPER_BAYES.md` — Popper's corroboration is Bayesian updating
without the prior. The same structure: you optimize one thing (likelihood),
you care about another (posterior probability of the true hypothesis), and
the connection is the prior. Sutskever's compression framework provides the
prior — the Kolmogorov prior — that bridges the two.

→ `connections/HUME_HALTING.md` — the reason unsupervised learning has no
guarantee equivalent to supervised learning is the same reason K(x) is
uncomputable. Both are asking whether an infinite search terminates.

---

## The Central Connection

Sutskever's talk is the informal version of the `shannon` paper's thesis.

The `shannon` paper proves that transformers implement exact belief propagation
on factor graphs — that the architecture precisely implements Bayesian inference,
not just approximately. Sutskever's claim is that SGD over neural networks
approximates the Kolmogorov compressor — an informal, approximate version of
the same statement.

The relationship:

    Sutskever (informal):   SGD ≈ program search ≈ Kolmogorov compressor
    shannon paper (formal): transformer = exact BP on factor graph = Bayesian inference

Both are saying: the architecture is not just inspired by inference, it
implements it. The `shannon` paper provides the proof that Sutskever's intuition
was pointing toward.

---

## A New Connection to Add to connections/OVERVIEW.md

This talk suggests an eleventh connection not yet in the `connections/` directory:

**Sutskever's "unsupervised learning mystery" is the same as the problem of the
prior in Bayesian inference.**

The mystery: you optimize the likelihood (next-token prediction) but somehow
get good representations of the world. Why?

The answer: because the likelihood is proportional to the compression quality,
and good compression requires finding the true structure of the data, and the
true structure of the data is exactly what the posterior (after Bayesian updating
with the Kolmogorov prior) concentrates on.

The "mystery" dissolves when you see that maximizing the likelihood is the same
as minimizing L(D|H), and doing so over a function class large enough to
approximate the Kolmogorov compressor means also implicitly minimizing L(H).
The two terms in the MDL objective are both being optimized — L(D|H) explicitly,
L(H) implicitly through the architecture's inductive bias.

This is why bigger models generalize better: they have lower inductive bias
(lower implicit L(H) penalty), so they can approximate a wider range of short
programs, so they get closer to the true Kolmogorov compressor.