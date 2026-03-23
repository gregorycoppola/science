# Kuhn's Paradigm Shifts Are MDL Phase Transitions

## Kuhn's Description

Kuhn described scientific revolutions as discontinuous transitions between paradigms. Normal science operates within a paradigm, accumulating anomalies without abandoning the framework. At some point — not determined by any simple rule — confidence breaks down, a new paradigm is proposed, and scientists switch. The switch is not fully rational by Popper's lights: scientists do not abandon a paradigm at the first falsification. They hold on, patch, and protect it, sometimes for decades. When they finally switch, the new paradigm is incommensurable with the old — it changes what the basic concepts mean.

Kuhn thought this was evidence that science is partly irrational — that sociological and psychological factors determine paradigm choice in ways that logic alone cannot justify.

## The MDL Translation

Under the MDL framework, a research paradigm is a hypothesis class — a family of theories sharing a common structure, mathematical language, and set of background assumptions. The current best theory within the paradigm is the hypothesis H that minimizes L(H) + L(D|H) within that class.

Normal science is optimization within a fixed hypothesis class: adjusting parameters, adding auxiliary hypotheses, refining the model. Each adjustment is legitimate as long as it decreases total description length.

Anomalies are observations that the current theory compresses poorly — they inflate L(D|H). The standard response is to modify the protective belt (add an auxiliary hypothesis), which increases L(H) slightly. If the modification decreases L(D|H) by more than it increases L(H) — if it is a progressive modification in Lakatos's sense — it is rationally justified. The total description length decreases.

A paradigm becomes degenerating when each new anomaly requires a protective belt modification that increases L(H) by more than it decreases L(D|H). The total description length is growing. The paradigm is losing the compression competition.

A paradigm shift occurs when a competing hypothesis class — a new paradigm — achieves lower total description length than the incumbent, including all its protective belt modifications. At that point, switching is rationally mandatory: the new paradigm compresses the data better. The shift is discontinuous because hypothesis classes are discrete objects — you cannot smoothly interpolate between Ptolemaic and Copernican astronomy.

## Why the Shift Looks Irrational

Kuhn noted that scientists often hold on to a degenerating paradigm long after anomalies have accumulated. Under MDL, this is explained by two factors:

First, the comparison requires a concrete competing hypothesis, not just dissatisfaction with the incumbent. Scientists are right to hold on to a degenerating paradigm if no better alternative exists — an unknown competitor with lower description length is not available for comparison. "This paradigm is degenerating" is not sufficient reason to abandon it; "this competing paradigm achieves lower description length" is.

Second, the description length of the new paradigm includes the cost of learning its conceptual framework. Early adopters of a new paradigm face a higher effective L(H) — they have not yet developed the tools, training, and expertise to express problems efficiently in the new framework. As the community develops the new paradigm, its effective description length decreases. The rational moment to switch depends on your position in this learning curve.

Both factors explain the sociological messiness Kuhn observed without invoking irrationality. Scientists are approximately rational Bayesian agents operating under realistic constraints: limited time, incomplete access to competing hypotheses, and learning costs for new frameworks.

## The Phase Transition

The discontinuity of paradigm shifts is not a defect in scientific rationality — it is a mathematical feature of optimization over discrete hypothesis classes.

When you are minimizing a function over a continuous space, the minimum shifts continuously as parameters change. When you are choosing between discrete hypothesis classes, the minimum can jump discontinuously: class A is optimal until some threshold, then class B is optimal. The crossover is sharp even though the underlying quantities — description lengths — change continuously.

This is a phase transition in the physics sense: a discontinuous change in the state of a system (which paradigm is optimal) as a continuous parameter (accumulated data, description length) crosses a threshold. Water does not gradually become ice — it switches at 0°C. Paradigms do not gradually give way — they switch when the description length crossover is reached.

Kuhn correctly identified the phenomenology of phase transitions in scientific knowledge. MDL provides the thermodynamics underneath.