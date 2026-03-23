# Kolmogorov Complexity: The Formal Definition

## Setup

Fix a universal Turing machine `U`. The Kolmogorov complexity of a finite binary string `x` with respect to `U` is:

    K_U(x) = min { |p| : U(p) = x }

where the minimum is taken over all binary programs `p` such that `U` halts on input `p` and outputs `x`, and `|p|` is the length of `p` in bits. If no such `p` exists, `K_U(x) = ∞` (but for any finite string, a trivial program exists that just hardcodes `x`, so this never happens).

This is the **plain** Kolmogorov complexity. There is also a **prefix-free** variant, written `K(x)` or sometimes `K_m(x)`, where programs are required to be prefix-free (no valid program is a prefix of another). The prefix-free version has cleaner information-theoretic properties and is the standard choice in most theoretical work. The distinction matters for some theorems but not for the intuition.

## Key Theorems

**The Invariance Theorem**

For any two universal Turing machines `U` and `V`:

    | K_U(x) - K_V(x) | ≤ c_{U,V}

where `c_{U,V}` is a constant that depends only on the machines, not on `x`. For large strings, this constant becomes negligible relative to `K(x)`. The complexity is machine-independent up to a fixed overhead.

This is what makes `K(x)` an objective property of the string rather than an artifact of implementation. See `INVARIANCE.md` for the proof idea.

**Upper Bound**

For any string `x` of length `n`:

    K(x) ≤ n + O(1)

The trivial program that outputs `x` hardcoded has length roughly `n`. You can always describe a string by just writing it out.

**Most Strings Are Incompressible**

For any length `n`, at most `2^{n-c}` strings of length `n` have `K(x) < n - c`. This follows from a counting argument: there are only `2^{n-c}` programs shorter than `n - c` bits, so they can generate at most `2^{n-c}` distinct strings. Therefore, most strings of length `n` satisfy `K(x) ≥ n - O(1)`. They cannot be compressed.

This is important: *structured* strings are rare. Random strings are typical. When we encounter a compressible string in nature — a genome, a trajectory, a spectrum — that compressibility is evidence of an underlying generative process, i.e., a cause.

**Symmetry of Information**

For strings `x` and `y`:

    K(x, y) = K(x) + K(y | x) + O(log n)

The joint complexity equals the complexity of `x` plus the complexity of `y` given `x`. This is the Kolmogorov analogue of the chain rule for Shannon entropy, and it behaves as expected.

**Conditional Complexity**

    K(x | y) = min { |p| : U(p, y) = x }

The conditional complexity of `x` given `y` is the length of the shortest program that outputs `x` when given `y` as an auxiliary input. If `K(x | y) << K(x)`, then `y` contains substantial information about `x` — knowing `y` makes `x` much easier to describe.

**Kolmogorov Complexity and Entropy**

For a random variable `X` drawn from a computable distribution `P`:

    E[K(X)] ≈ H(X)

where `H(X)` is the Shannon entropy. The expected Kolmogorov complexity of a random string equals its Shannon entropy, up to lower-order terms. This connects the two theories: Kolmogorov complexity is the pointwise version of Shannon entropy. Shannon entropy is what you get when you average Kolmogorov complexity over a distribution.

## What These Theorems Mean Together

The key package is this:

1. `K(x)` is well-defined and objective (Invariance Theorem).
2. Short descriptions are rare — most strings cannot be compressed (incompressibility result).
3. When a string *can* be compressed, that is a non-trivial structural fact about it.
4. The framework connects cleanly to information theory (entropy connection).

Science finds compressible strings in nature — patterns, regularities, laws — and proposes short generators for them. The theorems above tell us that finding such strings is genuinely informative (they are rare), that the compression is an objective property (not observer-dependent), and that the theory connects to everything else we know about information.