# Minimum Description Length: The Computable Approximation

## The Gap

Kolmogorov complexity is the right objective but an uncomputable one. To do science — to actually choose between theories, fit models, and evaluate claims — you need a computable approximation.

Minimum Description Length (MDL), introduced by Jorma Rissanen in 1978, is that approximation. It is the version of Kolmogorov complexity you can use in practice.

## The Core Idea

Given a hypothesis `H` and data `D`, define:

    MDL(H, D) = L(H) + L(D | H)

where:

- `L(H)` is the description length of the hypothesis — how many bits it takes to write down.
- `L(D | H)` is the description length of the data given the hypothesis — how many bits you need to describe `D` once you already have `H`. This equals the negative log-likelihood under `H`, for the right choice of code.

The best theory is the one that minimizes `MDL(H, D)`. This is a computable number for any fixed hypothesis class and coding scheme.

## Three Concrete Examples

**Model selection in regression**

You are fitting a curve to 100 data points. A degree-1 polynomial (a line) has 2 parameters. A degree-10 polynomial has 11 parameters. The degree-10 polynomial fits the data more closely — it has lower `L(D | H)`. But it takes more bits to specify — higher `L(H)`. MDL penalizes the extra complexity. If the improvement in fit is not large enough to outweigh the cost of the extra parameters, MDL prefers the line. This is a formal version of the statistician's intuition that "overfitting is bad."

**Lossless compression**

A lossless compressor (gzip, bzip2, zstd) is explicitly minimizing `L(D | H)` for a fixed implicit `H` (the compression model). The compressed size of a file is a direct upper bound on its Kolmogorov complexity. This means you can measure the structural complexity of any dataset by trying to compress it: a highly compressible file has low MDL.

This is surprisingly useful in practice. Researchers have used compression ratios to measure the complexity of genomes, texts, time series, and images — without specifying any explicit model. The compressor is the model.

**Theory comparison in physics**

Newton's gravity and Einstein's general relativity both predict planetary orbits well in the weak-field, slow-velocity regime. In that regime, `L(D | H)` is similar for both. But `L(H)` differs: Newton's theory is shorter — it has fewer equations, fewer concepts, fewer special cases. MDL prefers Newton in that regime, for exactly that reason. In the strong-field regime (near black holes, at high velocities), GR's `L(D | H)` drops dramatically — it predicts things Newton cannot. Then MDL prefers GR. The theory switch is a principled MDL decision, not a matter of taste.

## The Relationship to Bayesian Inference

MDL and Bayesian inference are closely related. Under a uniform prior over programs of length `L(H)`, the Bayesian posterior is proportional to:

    P(H | D) ∝ 2^{-L(H)} · P(D | H)

Taking logs:

    log P(H | D) = -L(H) + log P(D | H) + const
                 = -MDL(H, D) + const

Maximizing the Bayesian posterior is equivalent to minimizing MDL, for the right choice of prior and coding scheme. MDL is Bayesian inference with the Kolmogorov/Solomonoff prior approximated by a specific code length.

## The Two-Part Code

The MDL formula `L(H) + L(D | H)` is called a two-part code. You transmit `H` first, then `D` compressed using `H`. The total transmission cost is the MDL.

This framing makes the tradeoff vivid. A theory that is too simple (short `L(H)`, large `L(D | H)`) leaves the data poorly explained — many residual bits to transmit. A theory that is too complex (long `L(H)`, small `L(D | H)`) spends too many bits describing itself. The optimum is the theory that compresses the combined description most.

Science is the search for short two-part codes for the world.

## Limitations

MDL depends on the choice of coding scheme. Different codes give different description lengths, and the ranking of theories can in principle depend on this choice. In practice, for reasonable codes and large data, the rankings are stable — the data length dominates the code-length differences. But for small datasets, the choice of code matters, and MDL gives different answers for different choices.

This is the computable analogue of the Invariance Theorem's constant: you pay a fixed overhead for the choice of representation, and for large enough data, it becomes negligible.