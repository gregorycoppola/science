# The Invariance Theorem

## The Problem It Solves

The definition of `K_U(x)` depends on the choice of universal Turing machine `U`. Different machines have different instruction sets, different encodings, different ways of reading a program. If `K` could vary arbitrarily between machines, it would not be a property of the string — it would be a property of whoever chose the machine.

The Invariance Theorem says this worry is bounded. The choice of machine affects `K` by at most a fixed constant, independent of the string being measured.

## The Theorem

For any two universal Turing machines `U` and `V`, there exists a constant `c_{U,V}` such that for all strings `x`:

    | K_U(x) - K_V(x) | ≤ c_{U,V}

The constant `c_{U,V}` is the length of a "translator" program that simulates `V` on `U` (or vice versa). It depends only on the two machines, not on `x`.

## The Proof Idea

Suppose you have a program `p` that runs on `V` and outputs `x`, with `|p| = K_V(x)`. To run `p` on `U`, prepend a fixed simulator: a program of length `c` that, when given `p` as input, simulates `V` running `p`. The total program for `U` has length `c + K_V(x)`. Therefore:

    K_U(x) ≤ K_V(x) + c

By symmetry:

    K_V(x) ≤ K_U(x) + c'

Combining:

    | K_U(x) - K_V(x) | ≤ max(c, c')

The simulator cost is paid once, as a fixed overhead, regardless of how long `x` is. For large `x`, this constant is negligible.

## What This Means in Practice

The invariance theorem establishes that Kolmogorov complexity is a property of the string, not the machine — *for all but small strings*. For strings of length, say, a million bits, a constant overhead of a few thousand bits (the cost of the simulator) is less than 1% of the total. The ranking of strings by complexity is stable across all reasonable choices of machine.

This is the sense in which Kolmogorov complexity is *objective*. You and I can use different programming languages, different computer architectures, different encodings — and we will assign approximately the same complexity to any large string. Our measurements are comparable. The complexity is a fact about the string, not about us.

## The Analogy to Physical Units

A useful analogy: the choice of universal Turing machine is like the choice of measurement units. The length of a table is the same whether you measure in meters or feet — you just get different numbers, related by a fixed conversion factor. The invariance theorem says Kolmogorov complexity is the same way: the "conversion factor" between two machines is `c_{U,V}`, and it is fixed.

This is why, in most theoretical work, people write `K(x)` without subscript — they are working up to the additive constant, which does not affect any of the important results.