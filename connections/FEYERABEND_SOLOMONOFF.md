# Feyerabend's "Anything Goes" Is the Solomonoff Prior

## Feyerabend's Claim

In *Against Method* (1975), Feyerabend argued that no hypothesis should be excluded from science a priori. The history of science shows that ideas dismissed as absurd, unscientific, or methodologically inadmissible have repeatedly turned out to be productive or correct. Atomism was dismissed for centuries. Continental drift was laughed at. Heliocentrism violated the physics and common sense of its day.

The methodological lesson Feyerabend drew: any rule that excludes hypotheses before the data speaks will, at some point, exclude the right hypothesis. The only safe policy is: anything goes. All hypotheses are admitted to the competition; the data decides.

This sounds like nihilism. It is not. It is a claim about the prior.

## The Solomonoff Prior

The Solomonoff prior assigns to every computable hypothesis H a prior probability proportional to 2^{-K(H)}. Every computable hypothesis receives nonzero prior mass. No computable hypothesis is excluded.

This is "anything goes" made precise. The prior is maximally permissive: nothing is ruled out before the data speaks. What varies is not admissibility but weight — simpler hypotheses get more prior mass, complex ones get less, but none gets zero.

The Solomonoff prior is not permissive because permissiveness is a good philosophical attitude. It is permissive because any prior that assigns zero probability to some computable hypothesis is provably suboptimal: if that hypothesis is true, the prior will never recover no matter how much data arrives. A zero prior is permanent exclusion. The Solomonoff prior avoids permanent exclusion of any computable hypothesis because doing so is the optimal strategy.

## Feyerabend Was Right, For the Right Reason

Feyerabend argued for permissiveness on historical grounds: science has always needed to entertain "forbidden" hypotheses. The Solomonoff framework shows why this is correct on mathematical grounds: a prior that excludes any computable hypothesis is strictly worse than one that does not, in a precise and provable sense.

Feyerabend could not say *why* anything goes — he could only gesture at the history and say that restrictive methodologies have always eventually excluded the right idea. The Solomonoff prior gives the reason: universal admissibility is the uniquely optimal prior policy for prediction in any computable environment.

## What Feyerabend Got Wrong

Feyerabend drew the wrong lesson from the correct insight. From "no hypothesis should be excluded a priori," he concluded "there is no method." But the Solomonoff framework shows that universal admissibility is entirely consistent with a precise, principled method: assign priors by description length, update by Bayes' rule, prefer hypotheses that compress the data.

The method does not exclude any hypothesis. It ranks them. "Anything goes" as a prior policy is compatible with — in fact, requires — a rigorous update rule. Feyerabend collapsed the distinction between the prior (where permissiveness is correct) and the posterior (where the data decides and some hypotheses are clearly better than others).

The anarchism is in the prior. The method is in the update.

## The Irony

Feyerabend was one of the most anti-formalist philosophers of science. He distrusted mathematical frameworks, dismissed attempts to formalize scientific method, and celebrated the irreducible messiness of actual science. The irony is that his central positive claim — anything goes — is the one that most clearly has a precise mathematical formulation, and that formulation (the Solomonoff prior) fully vindicates his insight while dissolving his anarchism.