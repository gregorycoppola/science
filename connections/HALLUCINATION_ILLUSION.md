# Hallucination in LLMs and Perceptual Illusions Are the Same Failure Mode

## Two Phenomena

**Perceptual illusions** — the hollow mask illusion, the Müller-Lyer illusion, the McGurk effect — are cases where perception delivers a false report about the world. The brain "sees" something that is not there, or fails to see something that is. These are not errors of attention or reasoning — they are failures at the level of basic perception.

**LLM hallucination** — a language model confidently asserting false facts, inventing citations, confabulating biographical details, generating plausible-sounding but incorrect technical content. These are not errors of reasoning either, in any simple sense — the model is often doing something locally coherent while globally wrong.

Both are typically described as failures of their respective systems. They are better understood as a single computational pathology: the prior dominating the likelihood.

## The Bayesian Framework

In predictive coding, perception is posterior inference:

    P(world-state | sensory-input) ∝ P(sensory-input | world-state) · P(world-state)

The prior P(world-state) is the brain's generative model — everything it has learned about the statistics of the world. The likelihood P(sensory-input | world-state) is determined by the current sensory input. The posterior is the percept.

An illusion occurs when the prior is so strong that it overwhelms the likelihood. The brain's model says "faces are convex" with such high probability that even when the sensory input is consistent with a concave face (the hollow mask), the posterior still assigns high probability to convex. The percept is wrong because the prior won.

In a language model, generation is sampling from:

    P(next-token | context) ∝ P(context | next-token) · P(next-token)

where P(next-token) is the prior from pretraining (the statistics of all text ever seen) and P(context | next-token) is the grounding signal from the current context. Hallucination occurs when the prior — the learned statistics of what plausibly follows — overwhelms the grounding signal from the specific context. The model generates what typically follows text like this, rather than what specifically follows from the facts stated.

Both are the same failure: the prior is too confident relative to the likelihood.

## The Hollow Mask and GPT Confabulation

The hollow mask illusion is one of the strongest perceptual illusions known. When the inside of a face mask is shown rotating, observers perceive it as convex — even when they know it is concave, even when they are told explicitly to look for the concavity. The prior for convex faces is so strong that it cannot be overridden by direct sensory evidence.

A language model asked about a fictional person it has no training data on will often confabulate biographical details — name, affiliation, publications — drawn from the statistics of similar real people. The context says "this person exists and you know about them"; the prior fills in plausible details from similar contexts in training data. The grounding signal (there is no such person) cannot override the prior (people fitting this description usually have these attributes).

Same structure. Same failure. Different substrate.

## The Precision-Weighting Connection

In Friston's free energy formulation, the balance between prior and likelihood is governed by precision weighting: each signal is weighted by its estimated reliability. High-precision sensory signals override priors; low-precision signals are overridden by priors.

Illusions often occur under low-precision sensory conditions: ambiguous images, brief exposures, peripheral vision, poor lighting. When the sensory signal is weak (low likelihood precision), the prior dominates.

LLM hallucinations are more frequent when the grounding signal is weak: vague prompts, questions about obscure topics, requests for specific numerical facts not well-represented in training data. When the context provides a weak likelihood signal, the prior dominates.

The precision-weighting framework unifies both: any inference system that balances prior and likelihood will exhibit prior-domination pathologies when the likelihood signal is weak relative to the prior. This is not a defect in the system — it is mathematically inevitable. The pathology is the correct Bayesian response to an unreliable likelihood, given a strong prior.

## Implications for Alignment

The connection has practical implications. If hallucination is prior domination, the fix is not primarily architectural — it is about strengthening the grounding signal (the likelihood) relative to the prior.

Retrieval-augmented generation (RAG) does this: it injects high-precision factual context into the prompt, increasing the likelihood signal for specific facts. This is the computational equivalent of improving sensory precision to overcome an illusion — flooding the system with high-quality evidence to override the prior.

Fine-tuning on factual accuracy is a prior adjustment: it shifts the prior toward distributions that weight grounding over plausibility. This is the computational equivalent of training observers to attend to low-level sensory signals rather than top-down priors — it works but is incomplete, because the prior is deeply baked in.

Constitutional AI and RLHF can be understood as precision training: teaching the model to assign high precision (high confidence) only to claims well-supported by context, and low precision to claims relying heavily on prior statistics. The goal is calibrated precision weighting, not elimination of the prior.

The prior cannot be eliminated — it is what makes the system work at all. The goal is correct balance.