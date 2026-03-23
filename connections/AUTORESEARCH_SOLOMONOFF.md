# AutoResearch Is Solomonoff Induction Made Computable and Distributed

## Solomonoff Induction: The Ideal

Solomonoff induction is the theoretically optimal prediction strategy. Given observations D, maintain a prior over all computable hypotheses H weighted by 2^{-K(H)}, update by Bayes' rule, and predict using the posterior. This strategy is provably optimal: no other prediction strategy outperforms it by more than a fixed constant, across all computable environments.

It is also uncomputable. Implementing it directly requires:
1. Enumerating all computable hypotheses — an infinite set.
2. Computing K(H) for each — undecidable.
3. Computing P(D|H) for each — requires running each hypothesis against the data.
4. Normalizing the posterior — requires summing over an infinite set.

None of these steps can be done exactly. Solomonoff induction is an ideal: the limit that computable methods approximate.

## Karpathy's AutoResearch: The Approximation

Karpathy's AutoResearch system (discussed on the No Priors podcast, March 2026, and released as a public repo) runs a closed loop:

1. An agent proposes a modification to a training script or model configuration — a hypothesis about how to improve the model.
2. The modification is evaluated by training and measuring a reward signal (validation loss, benchmark accuracy).
3. If the reward improves, the modification is kept; if not, it is discarded.
4. The loop repeats, with the improved model as the new baseline.

This is a computable approximation to Solomonoff induction, with the following correspondences:

- **The hypothesis space** is the space of training scripts, model configurations, and hyperparameter settings — a computable, enumerable space.
- **K(H)** is approximated by the complexity of the proposed modification. Smaller modifications (fewer lines changed, simpler transformations) correspond to lower description length. The agent's tendency to propose local modifications first is an implicit Kolmogorov prior.
- **P(D|H)** is approximated by the reward signal — the validation loss or benchmark score after training with the proposed modification. Lower loss = higher likelihood of the training data under the modified hypothesis.
- **The posterior update** is the keep/discard decision: modifications that improve the reward (increase P(D|H)) are kept, weighted implicitly by their simplicity.
- **The normalization** is handled by the competitive structure: at any point, the current best model is the hypothesis with the highest posterior among all proposals evaluated so far.

## The SETI@Home Distribution

Karpathy's vision for AutoResearch includes a SETI@Home-style distributed component: many agents, running in parallel on distributed hardware, each exploring different regions of the hypothesis space. The key insight he identified: finding a good commit is hard (requires many failed attempts), but verifying it is cheap (just retrain once and measure).

This asymmetry is exactly the search/verify asymmetry in Solomonoff induction:
- **The search** — finding a short program that compresses the data — is hard (computationally expensive, requires exploring a large space).
- **The verification** — checking whether a proposed program achieves the claimed compression — is cheap (just run it and measure).

The distributed structure parallelizes the search over hypothesis space. Each agent is exploring a different region of the space of computable modifications. The results are pooled, with each verified improvement accepted regardless of which agent found it. This is crowd-sourced search over the hypothesis space — the most natural way to approximate Solomonoff induction when the hypothesis space is large and the search is expensive.

## The Untrusted Source Property

Karpathy specifically designed AutoResearch to accept contributions from untrusted sources. An agent whose identity and intentions are unknown can submit a modification; if it verifies (the reward improves), it is accepted.

This is the Kolmogorov principle applied to institutions: trust the object, not the messenger. A modification is evaluated by whether it reduces description length of the training data — a property of the modification itself. The source is irrelevant.

This is not just a nice design property — it is what makes distributed AutoResearch sound. If verification required trusting the source, the system would be gated by identity verification and could not scale to an open, SETI@Home-style network. Because verification is a property of the object (does the loss go down?), the system can safely accept contributions from arbitrary agents without requiring trust in any of them.

## The Limit

AutoResearch is an approximation to Solomonoff induction in the same way that MDL is an approximation to Kolmogorov complexity: it converges toward the ideal from above, without ever reaching it exactly.

The gaps:
- The hypothesis space is restricted to modifications of a specific training framework, not all computable programs.
- The reward signal is a proxy for P(D|H), not the true likelihood.
- The prior is implicit rather than explicitly computed from description length.
- The search is heuristic, not exhaustive.

Each of these gaps is a direction for improvement. And the ideal — Solomonoff induction — tells you what "improvement" means: closer to optimal prediction across all computable environments. AutoResearch is not inspired by Solomonoff induction as a vague philosophical guide. It is a direct engineering approximation to it, with well-characterized gaps and a clear direction for reducing them.

## The Broader Point

AutoResearch is the most concrete current example of the science objective function being operationalized at scale. The objective — minimize L(H) + L(D|H) — is being approximated by a distributed search process that proposes hypotheses and verifies them cheaply. The connection to Solomonoff is not metaphorical: it is structural. The system is doing what Solomonoff induction prescribes, by the only means available to a computable system operating in finite time.

This is what it looks like when the philosophy of science is turned into engineering.