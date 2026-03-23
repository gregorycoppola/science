# Bayesian Epistemology: Probability as Degree of Belief

## The Core Claim

Bayesian epistemology is the philosophical position that probabilities are *degrees of rational belief* — numbers between 0 and 1 that represent how confident a rational agent is in a proposition, not how often that proposition is true in repeated trials.

Under this view:

- "The probability of rain tomorrow is 0.7" means: a rational agent with current knowledge should be 70% confident it will rain — not that it rains on 70% of days like this one.
- "The probability that the Riemann hypothesis is true is 0.95" is a meaningful statement — even though the hypothesis is either true or false and there are no repeated trials.
- Every rational agent has a probability distribution over every proposition they have an opinion about. Updating that distribution by Bayes' rule when new evidence arrives is what rational reasoning consists of.

## The Dutch Book Argument

Why should degrees of belief obey the probability axioms? The standard argument is the *Dutch book*.

Suppose your degrees of belief do not obey probability theory — say, you assign probability 0.6 to "it rains tomorrow" and 0.6 to "it does not rain tomorrow." A clever bookie can construct a set of bets that you consider fair (because each bet's odds match your stated probabilities) but which guarantee you lose money regardless of what happens. You are "Dutch booked."

If your degrees of belief satisfy the probability axioms, no such guaranteed-loss betting scheme exists. Coherent degrees of belief — ones that satisfy probability theory — are exactly those that cannot be Dutch booked.

This argument establishes the *form* of rational belief: it must obey probability theory. Bayesian epistemology adds that the *update rule* must be Bayes' rule. An agent who updates by any other rule can also be Dutch booked over time.

## Subjective vs. Objective Bayesianism

Bayesian epistemologists divide into two camps on the prior.

**Subjective Bayesianism** (de Finetti, Savage): the prior is a personal, subjective starting point. Any prior is legitimate as long as it is coherent (obeys the probability axioms). Different rational agents can have different priors and there is nothing to adjudicate between them. What matters is that each agent updates consistently by Bayes' rule. Over time, with enough data, agents with different priors will converge to the same posterior — the data eventually washes out the prior.

**Objective Bayesianism** (Jeffreys, Jaynes, and ultimately Solomonoff): there are better and worse priors, and in some cases a uniquely correct prior. Jeffreys priors are invariant under reparametrization — they do not depend on how you choose to describe the hypothesis space. The maximum entropy prior is the one that encodes the least information beyond the stated constraints. The Solomonoff prior is the one grounded in Kolmogorov complexity. Objective Bayesians hold that the prior is not arbitrary — it should reflect logical relationships between propositions, not personal whim.

The disagreement between subjective and objective Bayesians is deep, but both agree on the update rule. The fight is about where to start.

## Cox's Theorem

A more direct justification for Bayesian epistemology comes from Cox's theorem (1946). Cox asked: suppose you want a system for representing degrees of plausibility that satisfies a small set of reasonable desiderata —

1. Degrees of plausibility are represented by real numbers.
2. The system is consistent with ordinary logic.
3. The system is consistent in the sense that equivalent problems get the same answer.

Cox proved that any such system must be isomorphic to probability theory. The probability axioms are not arbitrary — they are the unique consistent extension of classical logic to graded belief.

This is a powerful result. It says: if you want to reason under uncertainty and you want your reasoning to be consistent, you must use probability theory. Bayesian epistemology is not one option among many — it is the only coherent option.

## What Bayesian Epistemology Implies for Science

If Bayesian epistemology is right, then science is a collective Bayesian updating process. The scientific community maintains a prior over theories, updates it with experimental evidence, and the posterior at any time represents the current state of knowledge.

This framing clarifies several things:

- **Why replication matters**: a single experiment is one likelihood update. Replication is multiple independent updates, which compound. Irreproducible results produce small updates that wash out quickly.
- **Why extraordinary claims require extraordinary evidence**: a hypothesis with a very low prior requires a very high likelihood ratio to achieve a reasonable posterior. "Extraordinary claims require extraordinary evidence" is just Bayes' rule.
- **Why consensus is not truth**: the posterior depends on the prior. If the prior of the community is wrong — if important hypotheses were never considered — the posterior can be confidently wrong. Scientific revolutions are corrections to the prior, not just updates from new data.
- **Why peer review is imperfect**: peer review approximates the likelihood evaluation. Reviewers assess whether the data supports the claims. But they do not always correct the prior — they can share the community's blind spots.