# Science

This repo develops a single thesis: **science has an objective function, and we can write it down.**

The objective function is the Bayesian/Kolmogorov framework — the combination of Bayes' rule with the Kolmogorov/Solomonoff prior. This is not a new proposal. It is a formal statement of what science has always been doing informally. The goal of this repo is to make that statement precise, connect it to the history of philosophy of science, and show how it bears on the most pressing current problems in scientific verification and automated research.

The repo is written for a smart scientific audience — someone comfortable with probability, information theory, and the idea of an objective function from machine learning — who wants to understand what the *right* objective function for science actually is, and why.

---

## The Core Idea in Three Sentences

Science finds short descriptions of large bodies of observations. The right way to formalize "short description" is Kolmogorov complexity. The right way to formalize "finds" is Bayesian inference with the Solomonoff prior.

Everything else in this repo is unpacking those three sentences.

---

## The Objective Function

The formal statement:

    minimize  L(H) + L(D | H)

where `H` is a hypothesis, `D` is observed data, `L(H)` is the description length of the hypothesis (approximating its Kolmogorov complexity), and `L(D | H)` is the description length of the data given the hypothesis (the negative log-likelihood). This is the **Minimum Description Length** (MDL) principle — the computable approximation to Solomonoff induction.

Unpacked:
- `L(H)` is Occam's razor, formalized. Simpler theories have shorter descriptions and are preferred, all else equal.
- `L(D | H)` is predictive accuracy. A theory that predicts the data well compresses it well.
- Together they define a single number that ranks any two theories against each other, given the same data.

This objective function is **objective** in both senses of the word: it is a *target* (something to minimize) and it is *observer-independent* (grounded in the structure of computation, not in any particular scientist's preferences). See `objective_functions/ETYMOLOGY.md` for why the word earns both meanings at once.

---

## Why This Matters Now

Two things are happening simultaneously that make this more than a philosophical exercise.

**AutoResearch**: Andrej Karpathy (No Priors podcast, March 2026) has proposed and built systems where AI agents autonomously run experiments, propose modifications, and optimize — closing the research loop without human intervention. The key insight: *finding a good result is hard, but verifying one is cheap.* This asymmetry is exactly the structure of Solomonoff induction: the search over hypothesis space is expensive, the verification of a proposed hypothesis is cheap. AutoResearch is Solomonoff induction made computable and distributed. See `connections/AUTORESEARCH_SOLOMONOFF.md`.

**Formal verification**: Large machine-verified proofs (Lean 4, Coq) are being produced by AI systems and dropped on the community by unknown or untrusted sources. The question of how to verify these — and more broadly, how to verify any scientific claim from an untrusted source — is now an engineering problem, not just a philosophical one. The answer the Kolmogorov framework gives: **trust the object, not the messenger.** A proof either type-checks or it doesn't. A theory either compresses the data or it doesn't. The source is irrelevant.

---

## Repo Structure

The repo is organized into five directories, each developing one thread. They are designed to be read independently or together.

### `objective_functions/`
The formal objective function for science, built up from first principles.

    README.md               — overview and the formal statement
    ETYMOLOGY.md            — what "objective" means; why the word earns both senses
    BAYES_KOLMOGOROV.md     — the full derivation: Bayes + Kolmogorov = MDL
    VERIFICATION.md         — the search/verify asymmetry; algorithmic and community protocols
    HISTORY.md              — how science has approximated this objective without writing it down
    kolmogorov_complexity/  — a full treatment of Kolmogorov complexity (see below)

### `objective_functions/kolmogorov_complexity/`
A self-contained treatment of Kolmogorov complexity. Start with `INTUITION.md` if you are new to the concept; the other files develop it formally.

    README.md               — map of the directory
    INTUITION.md            — what K(x) is, built from examples before any formalism
    FORMAL.md               — the precise definition and key theorems
    INVARIANCE.md           — why the choice of machine doesn't matter (up to a constant)
    UNCOMPUTABILITY.md      — why K is uncomputable, and why that is a feature not a bug
    MDL.md                  — Minimum Description Length: the computable approximation
    SOLOMONOFF.md           — how K generates the optimal prior for science
    CONNECTIONS.md          — connections to entropy, compression, randomness, learning theory

### `bayes/`
Everything the word "Bayesian" means — it is one of the most overloaded terms in science. Each file covers one sense.

    README.md               — map of the directory; how the senses fit together
    INFERENCE.md            — Bayes' rule: the mechanics of prior, likelihood, posterior
    EPISTEMOLOGY.md         — probability as degree of rational belief; Cox's theorem
    FREQUENTISM.md          — the frequentist alternative; what the debate is actually about
    NETWORKS.md             — Bayesian networks, factor graphs, belief propagation
    BRAIN.md                — the Bayesian brain; predictive coding; free energy principle
    LEARNING.md             — Bayesian learning; priors over parameters; connection to MDL

### `philosophy_of_science/`
The history of philosophy of science as a single long argument about Hume's problem of induction. Each movement is a response to the failures of the previous one. The Bayesian/Kolmogorov framework is where the argument arrives.

    README.md               — the through-line; the map
    INDUCTIVISM.md          — Bacon, Mill; the naive view most scientists implicitly hold
    HUME.md                 — the problem of induction; why it is devastating
    KANT.md                 — the synthetic a priori; what it saves and what it costs
    LOGICAL_POSITIVISM.md   — Vienna Circle, verificationism, its collapse
    POPPER.md               — falsificationism; conjectures and refutations
    KUHN.md                 — paradigms, normal science, scientific revolutions
    LAKATOS.md              — research programmes; the Popper/Kuhn synthesis
    FEYERABEND.md           — against method; anarchism in science
    BAYESIAN_CONFIRMATION.md — confirmation theory; probability as the logic of evidence
    NATURALISM.md           — Quine, Laudan; philosophy continuous with science
    REALISM.md              — scientific realism vs. antirealism; the live debate

### `connections/`
The most interesting thing in the repo. Each file identifies a place where two ideas from different traditions turn out to be the *same* idea, expressed in different language, developed by people who were not talking to each other. These are not analogies — they are identifications.

    OVERVIEW.md                     — all ten connections summarized; the meta-pattern
    HUME_HALTING.md                 — Hume's problem of induction IS the halting problem
    KUHN_MDL.md                     — paradigm shifts are MDL phase transitions
    BAYESIAN_BRAIN_TRANSFORMER.md   — the Bayesian brain and the transformer are the same architecture
    FEYERABEND_SOLOMONOFF.md        — "anything goes" is the Solomonoff prior
    POPPER_BAYES.md                 — corroboration is Bayesian updating without the prior
    REPLICATION_CRISIS_MDL.md       — the replication crisis is an MDL accounting error
    LAKATOS_COMPRESSION.md          — progressive vs. degenerating is compression growth vs. decay
    KANT_LAKATOS.md                 — the synthetic a priori is Lakatos's hard core
    HALLUCINATION_ILLUSION.md       — LLM hallucination and perceptual illusions are the same failure
    AUTORESEARCH_SOLOMONOFF.md      — AutoResearch is Solomonoff induction made computable

---

## Suggested Reading Paths

**If you want the core argument as fast as possible:**
`objective_functions/ETYMOLOGY.md` →
`objective_functions/BAYES_KOLMOGOROV.md` →
`objective_functions/kolmogorov_complexity/INTUITION.md` →
`objective_functions/kolmogorov_complexity/SOLOMONOFF.md` →
`connections/OVERVIEW.md`

**If you want the philosophical grounding:**
`philosophy_of_science/README.md` →
read the directory in order from `INDUCTIVISM.md` through `BAYESIAN_CONFIRMATION.md` →
`connections/HUME_HALTING.md` →
`connections/POPPER_BAYES.md`

**If you are coming from machine learning:**
`bayes/LEARNING.md` →
`objective_functions/kolmogorov_complexity/MDL.md` →
`connections/REPLICATION_CRISIS_MDL.md` →
`connections/HALLUCINATION_ILLUSION.md` →
`connections/AUTORESEARCH_SOLOMONOFF.md`

**If you are coming from neuroscience:**
`bayes/BRAIN.md` →
`bayes/NETWORKS.md` →
`connections/BAYESIAN_BRAIN_TRANSFORMER.md` →
`connections/HALLUCINATION_ILLUSION.md`

**If you want the single most surprising connection:**
`connections/HUME_HALTING.md`

---

## The Thesis, Stated Plainly

The history of philosophy of science is a record of humanity circling a single structure — the problem of optimal inference in a computable world — without the mathematical tools to see it directly. Hume identified the core impossibility. Popper, Kuhn, and Lakatos each described a facet of the solution without being able to state it. The Bayesian tradition formalized the update rule. Kolmogorov and Solomonoff formalized the prior.

The tools now exist to state the full solution:

**Science is the distributed search for hypotheses that minimize description length. Verification is cheap relative to discovery. The prior is the Solomonoff prior. The update rule is Bayes' rule. The objective function is MDL.**

Everything else is details.

---

## Related Work

- `shannon` repo — the Transformers are Bayesian Networks paper (formal proof that transformers implement exact belief propagation on factor graphs)
- `sigmoid-transformer-lean` — Lean 4 machine-verified proofs of the core results
- `bayes-learner` — empirical confirmation that gradient descent recovers BP weights to three decimal places
- Karpathy, AutoResearch (github.com/karpathy/autoresearch)
- Solomonoff (1964), "A formal theory of inductive inference"
- Rissanen (1978), "Modeling by shortest data description"
- Kolmogorov (1965), "Three approaches to the quantitative definition of information"
- Goldwasser, Micali, Rackoff (1989), "The knowledge complexity of interactive proof systems"
- Rao and Ballard (1999), "Predictive coding in the visual cortex"
- Friston (2005), "A theory of cortical responses"