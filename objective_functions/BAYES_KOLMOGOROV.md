# The Objective Function: Bayes + Kolmogorov

## The Claim

Science has an objective function. It has always had one. It just has not been written down in a single place. Written down, it is:

    maximize  log P(H | D)
            = log P(D | H) + log P(H) + const

where:

- `H` is a hypothesis — a theory, a model, a program
- `D` is observed data
- `P(D | H)` is the likelihood — how accurately `H` predicts `D`
- `P(H)` is the prior — how probable `H` is before seeing `D`

This is Bayes' rule. It is not controversial. The only question is: *what prior?*

## The Prior Problem

Bayes' rule is a framework, not a complete theory. It tells you how to update beliefs given evidence, but it requires a prior `P(H)` over hypotheses. If you can choose the prior arbitrarily, you can rationalize almost any conclusion. This is the standard objection to Bayesianism, and it is a fair one.

The Kolmogorov/Solomonoff answer: the prior is not arbitrary. There is a unique, principled choice grounded in the theory of computation.

## Kolmogorov Complexity

The Kolmogorov complexity `K(x)` of a string `x` is the length of the shortest program (on a universal Turing machine) that outputs `x` and halts.

    K(x) = min { |p| : U(p) = x }

where `U` is a fixed universal Turing machine and `|p|` is the length of program `p` in bits.

Intuitively: `K(x)` measures how compressible `x` is — how much structure it has. A string of a million zeros has very low `K` (the program is just "print zero one million times"). A random string has `K` close to its own length (no short description exists).

Two properties matter here:

**Universality**: The choice of universal Turing machine changes `K(x)` by at most a constant `c` that depends only on the two machines, not on `x`. So for long strings, `K` is machine-independent up to a fixed overhead. This is what makes it objective.

**Uncomputability**: `K(x)` is not computable in general. You cannot write a program that, given `x`, always outputs the length of the shortest program for `x`. This means Kolmogorov complexity is an ideal — a theoretical gold standard, not a practical algorithm.

## The Solomonoff Prior

Solomonoff (1964) proposed assigning to each hypothesis `H` a prior proportional to:

    P(H) ∝ 2^{-K(H)}

Shorter programs — simpler theories — get exponentially higher prior probability. This is Occam's Razor, derived from first principles rather than assumed as a philosophical preference.

The resulting update rule — Bayes with the Solomonoff prior — is called **Solomonoff induction**. It is provably optimal in a precise sense: no other prediction strategy can outperform it by more than a constant factor over all computable environments. It is the best possible Bayesian reasoner.

## Minimum Description Length

Because `K` is uncomputable, the practical version is the **Minimum Description Length (MDL)** principle (Rissanen, 1978). Instead of the shortest program, use the shortest description under some fixed code. The objective becomes:

    minimize  L(H) + L(D | H)

where `L(H)` is the description length of the hypothesis and `L(D | H)` is the description length of the data given the hypothesis (the negative log-likelihood under a specific coding scheme).

MDL is computable, model-selection consistent, and reduces overfitting by penalizing complexity directly. It is the working scientist's approximation to Solomonoff induction.

## Occam's Razor, Derived

The Solomonoff prior gives a formal justification for preferring simpler theories — not because simplicity is aesthetically appealing, but because under any universal prior, simpler programs dominate in the limit. Given enough data, the posterior concentrates on the shortest program consistent with the observations.

This means:

- Two theories that predict the data equally well are not equally good. The simpler one has higher posterior.
- A more complex theory needs to predict the data *better* to compensate for its higher complexity penalty.
- The scientist who adds epicycles to save a theory is doing something formally wrong: they are increasing `K(H)` without a commensurate gain in `log P(D | H)`.

## The Full Statement

The objective function for science is:

    maximize  log P(D | H) - K(H)  ·  ln 2

Subject to: `H` is a computable hypothesis.

In words: find the shortest program that best predicts all available observations. This is what science has always been doing. The Kolmogorov/Solomonoff framework is the formal statement of that informal practice.