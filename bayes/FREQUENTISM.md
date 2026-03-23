# Frequentism: The Other View

## The Frequentist Position

Frequentism holds that probabilities are properties of repeatable processes, not of beliefs. The probability of an event is its limiting frequency in an infinite sequence of independent repetitions under identical conditions.

Under this view:

- "The probability of heads is 0.5" means: if you flip this coin infinitely many times, heads will appear in half of them.
- "The probability that the Riemann hypothesis is true" is *not* a meaningful statement — the hypothesis is either true or false; there is no repeatable experiment.
- A 95% confidence interval does *not* mean you are 95% confident the true parameter is inside it. It means: if you repeated the experiment many times and computed the interval each time, 95% of those intervals would contain the true value.

The frequentist insists that probability belongs to the world, not to the mind. Probability is an objective feature of random processes, not a subjective assessment by an observer.

## Where Frequentism Is Right

Frequentism is well-suited to genuinely repeatable experiments. Quality control in manufacturing, clinical trials with many patients, physics experiments run thousands of times — these are settings where the frequentist interpretation is natural and the tools (p-values, confidence intervals, hypothesis tests) are well-calibrated.

The frequentist framework also has an important robustness property: it does not require a prior. If you have no idea what prior to use — or if you want your analysis to be convincing to people with very different priors — frequentist methods avoid the prior problem entirely by not using a prior.

## Where Frequentism Struggles

The frequentist framework breaks down when there is no natural reference class of repeated experiments.

- **One-off events**: what is the probability that a specific asteroid hits Earth in the next century? There is no ensemble of identical trials. Only the Bayesian interpretation gives a meaningful answer.
- **Parameter estimation**: a fixed parameter is either inside a confidence interval or it is not. The confidence is in the procedure, not in any particular interval. This is technically correct but often not what scientists want to know.
- **Model comparison**: comparing two non-nested models — ones that are not special cases of each other — is awkward under frequentism. Bayesian model comparison via Bayes factors handles it naturally.
- **Accumulating evidence**: p-values do not combine cleanly across studies. Bayesian posteriors do: each study's likelihood updates the prior, and the order does not matter.

## The p-value Problem

The p-value is the probability of observing data at least as extreme as what was observed, under the null hypothesis. It is not the probability that the null hypothesis is true. This distinction is routinely confused, and the confusion has real consequences.

A p-value of 0.04 does not mean there is a 4% chance the null is true. It means: if the null were true, you would see data this extreme 4% of the time. To get from there to "the probability the null is true is 4%," you need Bayes' rule — and Bayes' rule requires a prior.

With a low prior on the alternative hypothesis (which is common in fields where most tested hypotheses are false), a p-value of 0.04 can correspond to a posterior that still favors the null. This is part of the explanation for the replication crisis: researchers were treating p < 0.05 as strong evidence for the alternative, when the Bayesian calculation often showed otherwise.

## The Synthesis

The frequentist/Bayesian debate is not purely a matter of taste. The two frameworks make different recommendations, and one can be more appropriate than the other depending on the setting.

Roughly:

- Use frequentist methods when you have many repeated trials, when you want results that are convincing across different priors, or when you have no principled basis for a prior.
- Use Bayesian methods when you have genuine prior information, when you want to make probability statements about specific hypotheses, when you are combining evidence across studies, or when you are making decisions under uncertainty.

In the limit of large data, the two frameworks converge: the posterior concentrates near the true value, and the prior washes out. For finite data — which is always the actual situation — they can give very different answers, and choosing between them requires understanding what question you are actually trying to answer.

The deepest point: frequentism and Bayesianism are not competing theories of the same thing. They are answers to different questions. Frequentism asks: what is the behavior of this procedure over many repetitions? Bayesianism asks: given what I know, what should I believe? Both questions are legitimate. Science needs both answers.