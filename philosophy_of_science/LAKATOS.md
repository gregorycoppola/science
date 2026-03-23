# Lakatos: Research Programmes

## The Problem Lakatos Solved

Imre Lakatos (1922–1974) was Popper's student and Kuhn's most sophisticated critic. He agreed with Kuhn that Popper's naive falsificationism does not describe actual science. But he thought Kuhn's account made science look too irrational — a matter of sociological pressure and gestalt switches, not logical argument.

Lakatos's project: a methodology that is more realistic than Popper's but more rational than Kuhn's.

His answer: the methodology of scientific research programmes.

## The Structure of a Research Programme

A **research programme** is a sequence of theories connected by a common **hard core** — a set of fundamental assumptions that are treated as irrefutable by methodological fiat. Around the hard core is a **protective belt** of auxiliary hypotheses that absorb the shocks of anomalous observations.

When an experiment contradicts the programme's predictions, scientists do not abandon the hard core. They modify the protective belt: adjust an auxiliary assumption, add a correction term, revise a background condition. This is legitimate science — not ad hoc evasion.

What distinguishes a good research programme from a degenerating one is the direction of these protective belt adjustments:

- A **progressive** research programme makes protective belt modifications that lead to new predictions — predictions that are then confirmed. Each modification expands the programme's empirical content. The programme is growing.
- A **degenerating** research programme makes protective belt modifications that only account for already-known anomalies, without predicting anything new. The modifications are purely defensive — they explain yesterday's failures but risk nothing on tomorrow's tests.

## Examples

**Newtonian mechanics**: when Uranus's observed orbit deviated from Newtonian predictions, astronomers did not abandon Newton. They modified the protective belt — hypothesizing an unknown planet causing the perturbation. This led to the prediction and discovery of Neptune. A progressive modification.

**Bohr's early atomic model**: when it encountered anomalies, modifications were made that led to predictions about the spectra of new elements, subsequently confirmed. Progressive.

**Ptolemaic astronomy in its final phase**: each new anomaly required another epicycle, but the epicycles only explained the known anomaly — they predicted nothing new. The programme was degenerating. The Copernican programme was progressive by comparison: it predicted phenomena (stellar parallax, the phases of Venus) that the Ptolemaic programme could not.

## Rational Reconstruction

Lakatos argued that the history of science can be rationally reconstructed as a series of competing research programmes, evaluated by their progressiveness. Scientists who abandoned a degenerating programme in favour of a progressive one were acting rationally, even if they could not always articulate precisely why.

This gives a rational account of paradigm choice without requiring the immediate falsificationism Popper demanded. A theory can survive anomalies indefinitely — as long as the programme is progressive. When it stops being progressive, rational scientists should shift to a competitor.

## The Connection to MDL

Under the Kolmogorov/MDL framework, Lakatos's distinction maps cleanly:

A progressive research programme is one where successive modifications decrease `L(H) + L(D | H)` — the protective belt modifications are short (do not bloat the description length) and they genuinely compress new data (lower `L(D | H)` on new observations).

A degenerating research programme is one where modifications increase `L(H)` — the hypothesis grows more complex — without decreasing `L(D | H)` on new observations. The programme is adding complexity without adding compression. MDL says: stop and find a better hypothesis class.

## What Lakatos Left Open

Lakatos gave a criterion for evaluating research programmes in retrospect but not a decision procedure for acting in real time. How degenerate must a programme be before you should abandon it? He had no answer. Science involves rational judgment that cannot be fully algorithmized — and Lakatos, to his credit, acknowledged this.

The Bayesian framework provides a partial answer: compute the marginal likelihood of each programme given all available data. The programme with higher marginal likelihood should be preferred. But this requires making the programmes precise enough to compute likelihoods — which is exactly the work scientists do when they formalize a research programme into a quantitative model.