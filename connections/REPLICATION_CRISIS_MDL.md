# The Replication Crisis Is an MDL Accounting Error

## The Crisis

Beginning around 2011, a series of high-profile failures to replicate published findings in psychology and social science revealed a systematic problem. Effects that had been reported with p < 0.05 in leading journals — social priming, ego depletion, power poses, precognition — failed to replicate in large, well-powered follow-up studies. Estimates suggested that fewer than half of published findings in some subfields were replicable.

The proximate causes were identified: p-hacking (testing many hypotheses and reporting only significant ones), HARKing (hypothesizing after results are known), small underpowered samples, publication bias toward positive results. All of these are variants of the same underlying error.

## The MDL Diagnosis

The MDL objective is:

    minimize  L(H) + L(D|H)

The replication crisis resulted from systematically underreporting L(H) — the description length of the hypothesis.

When a researcher tests 20 hypotheses and reports the one with p < 0.05, the true description length of the reported hypothesis is not L(H_reported). It is:

    L(H_reported) + log₂(20)

The extra log₂(20) ≈ 4.3 bits is the cost of the search: the information required to specify which of the 20 tested hypotheses was selected. This cost is real — it is part of the description of the procedure that generated the result. Omitting it is an accounting error.

With the corrected description length, the apparent p < 0.05 result may not represent genuine compression of the data at all. The reported effect might be noise that happened to align with one of many tested hypotheses. The "finding" has high apparent L(D|H) reduction but the true L(H) is much larger than reported.

## The Formal Statement

Let H* be the hypothesis selected by a search procedure S over a hypothesis space of size N. The true two-part description length is:

    L(S) + L(H* | S) + L(D | H*)

where L(S) is the description length of the search procedure itself. For a search over N hypotheses, L(S) ≈ log₂(N). This is the bit cost of specifying "I tested N hypotheses and reported the best one."

Preregistration — committing to a single hypothesis before collecting data — sets L(S) ≈ 0. There is no search to report. The hypothesis complexity is just L(H), unaugmented by search cost. Preregistered studies have lower description length overhead and their results generalize because the L(H) term is honest.

## Why Results Don't Replicate

An MDL calculation with honest L(H) shows why p-hacked results fail to replicate. The apparent p-value is computed assuming L(H) = L(H_reported). The true L(H) = L(H_reported) + log₂(N). For N = 20 and a threshold of p = 0.05 (corresponding to a likelihood ratio of about 1/0.05 = 20), the true threshold should be p = 0.05/20 = 0.0025 — a Bonferroni correction.

Bonferroni correction is exactly the MDL accounting correction. It adjusts the significance threshold by the log of the number of tests, which is the description-length cost of the search. The Bonferroni correction has always been the right thing to do; the replication crisis is the empirical consequence of not doing it.

## The Fix Is MDL Compliance

The reforms proposed in response to the replication crisis — preregistration, larger samples, direct replication, registered reports, Bayesian model comparison — are all, in different ways, corrections toward honest MDL accounting:

- **Preregistration** eliminates search cost from L(H).
- **Larger samples** reduce variance in L(D|H), making the compression estimate more reliable.
- **Direct replication** checks whether the compression claimed in the original study holds on new data — the acid test of MDL.
- **Bayesian model comparison** uses the marginal likelihood, which integrates over the prior and automatically penalizes complexity.
- **Registered reports** separate hypothesis commitment (which fixes L(H)) from data collection (which determines L(D|H)).

The replication crisis is not a crisis of scientific honesty in most cases. It is a crisis of MDL literacy: a field-wide failure to correctly account for the description length of the hypotheses being tested. The fix is not moral reform — it is correct bookkeeping.