# Hume's Problem IS the Halting Problem

## The Two Problems

**Hume's problem of induction** (1748): no finite sequence of observations logically justifies a universal law. From a million observed white swans, you cannot deduce that all swans are white. No matter how many confirming instances you accumulate, the next observation could falsify the law. There is no computable procedure that, given finite observations, certifies a universal generalization.

**Turing's halting problem** (1936): there is no general algorithm that, given an arbitrary program and input, decides whether the program eventually halts. The decision problem for program termination is undecidable.

These look like different problems from different fields, separated by two centuries. They are the same problem.

## The Connection

Kolmogorov complexity K(x) is uncomputable because computing it would require solving the halting problem. To find the shortest program that outputs x, you would need to determine, for every program shorter than x, whether it halts and outputs x. This is a halting problem instance. Since the halting problem is undecidable, K(x) is uncomputable.

Now consider what Hume's problem says in computational terms. A universal law is a short program — a generator for an infinite class of observations. Confirming the law means finding a program that generates all observed data and certifying it is the shortest such program. But certifying that no shorter program exists requires checking whether every shorter program eventually fails to match the data — which requires deciding whether those programs halt on relevant inputs.

Hume's problem, translated: you cannot certify that you have found the shortest program consistent with your observations, because doing so requires solving the halting problem.

The reason induction cannot be justified is not a peculiarity of human reasoning or a gap in empiricist philosophy. It is an undecidability result. The justification Hume was looking for does not exist for the same reason that a general halting decider does not exist: both would require solving an undecidable problem.

## What This Means

**Hume's problem is not solvable** — not because philosophers have not been clever enough, but because it is provably unsolvable in the same sense that the halting problem is provably unsolvable. No philosophical argument, however sophisticated, will provide deductive certainty for inductive inference. The problem is not a gap in our understanding. It is a theorem.

**The Bayesian response is the correct response** — not because it solves Hume, but because it correctly reformulates the question. Instead of asking "can we be certain?", it asks "what is the optimal strategy given uncertainty?". Solomonoff induction is the optimal strategy: maintain a prior weighted by description length, update by Bayes' rule. This is provably optimal for prediction in any computable environment. Certainty is not available; optimality is.

**The uncomputability of K(x) is Hume's problem formalized**. When Kolmogorov complexity is defined, the uncomputability result is proved, and MDL is proposed as the computable approximation — this is exactly the structure of responses to Hume: acknowledge the problem is real, show that the ideal is well-defined even if uncomputable, provide a computable approximation that converges toward the ideal.

## The Philosophical Payoff

Philosophers spent two and a half centuries trying to solve Hume's problem by finding a logical justification for induction. The computability-theoretic perspective explains why they failed and why they were right to fail: they were trying to prove a theorem that is false. Induction cannot be deductively justified. The halting problem cannot be decided. These are the same impossibility.

What can be done — and what the Kolmogorov/Bayesian framework does — is show that the impossibility of certainty does not prevent optimal inference. You can be the best possible predictor in any computable environment without ever achieving certainty. The gap between "optimal" and "certain" is exactly the gap between computable approximations to K(x) and K(x) itself — a gap that exists, is well-characterized, and does not prevent science from working.