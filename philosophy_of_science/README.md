# Philosophy of Science

The history of philosophy of science is, at its core, a single long argument about one problem: Hume's problem of induction. Every major movement is either a response to it, a refinement of a previous response, or an attempt to dissolve it.

The problem, stated simply: no finite set of observations logically justifies a universal claim. You can observe a million white swans and still not prove all swans are white. Science makes universal claims constantly. How is this justified?

The answer this repo arrives at — developed across the `objective_functions/` and `bayes/` directories — is the Bayesian/Kolmogorov framework. But to understand why that answer is the right one, and what it actually solves, you need to understand the history of attempts that came before it. Each failed attempt clarifies the problem.

## The Through-Line

    Bacon: accumulate observations, induce laws.
    Hume: induction is never logically justified. Science is in trouble.
    Kant: the mind imposes structure — saves causality, but at a cost.
    Logical Positivism: meaning = verifiability. Too strong; collapses.
    Popper: falsifiability instead of verification. Better, but incomplete.
    Kuhn: science is sociological as much as logical. Paradigms, revolutions.
    Lakatos: research programmes — more rational than Kuhn, more realistic than Popper.
    Feyerabend: there is no method. Anything goes.
    Bayesian Confirmation: probability is the right logic of evidence.
    Naturalism: philosophy of science is continuous with science itself.
    Realism: do theories describe reality, or just save the phenomena?

## Contents

- `INDUCTIVISM.md` — Bacon, Mill, the view most working scientists implicitly hold
- `HUME.md` — the problem of induction; why it is devastating and never fully solved
- `KANT.md` — the synthetic a priori; what it saves and what it costs
- `LOGICAL_POSITIVISM.md` — Vienna Circle, verificationism, its collapse
- `POPPER.md` — falsificationism; conjectures and refutations
- `KUHN.md` — paradigms, normal science, revolutions
- `LAKATOS.md` — research programmes; the Popper/Kuhn synthesis
- `FEYERABEND.md` — against method; anarchism in science
- `BAYESIAN_CONFIRMATION.md` — confirmation theory; probability as the logic of evidence
- `NATURALISM.md` — Quine, Laudan; philosophy continuous with science
- `REALISM.md` — scientific realism vs. antirealism; the live debate

## The Verdict

The Bayesian/Kolmogorov framework does not solve Hume's problem in the sense of providing a logical deduction of universal laws from finite observations — no such deduction exists. What it does is show that Hume's problem, while real, does not prevent rational inference. You do not need certainty to reason well. You need a prior, a likelihood, and a commitment to update by Bayes' rule.

The Kolmogorov prior grounds the prior in computation rather than in subjective whim. The result is not a proof that science tracks truth — it is a proof that Bayesian inference with the Solomonoff prior is the optimal strategy for prediction in any computable environment. That is the most that can be asked for, and it is enough.