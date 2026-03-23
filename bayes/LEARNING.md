# Bayesian Learning: Priors Over Parameters

## The Setup

In machine learning, a model has parameters `θ` — the weights of a neural network, the coefficients of a regression, the parameters of a distribution. Standard (frequentist) learning finds the parameters that maximize the likelihood of the training data:

    θ_MLE = argmax_θ P(D | θ)

Bayesian learning treats the parameters as random variables and places a prior `P(θ)` over them. The result of learning is not a point estimate but a posterior distribution:

    P(θ | D) ∝ P(D | θ) · P(θ)

Predictions on new data `x*` are made by integrating over the posterior:

    P(y* | x*, D) = integral P(y* | x*, θ) · P(θ | D) dθ

This is the **posterior predictive distribution** — the Bayesian prediction, averaging over all parameter settings weighted by their posterior probability.

## Why Bayesian Learning Is Better in Principle

**Uncertainty quantification**: the posterior is a distribution, not a point. It tells you not just what the model predicts but how confident to be. A Bayesian model trained on little data will have a broad posterior — high uncertainty. A model trained on lots of data will have a sharp posterior — low uncertainty. Frequentist point estimates do not naturally represent this.

**Regularization from the prior**: the prior `P(θ)` acts as a regularizer. A Gaussian prior on weights corresponds exactly to L2 regularization (weight decay). A Laplace prior corresponds to L1 regularization (sparsity). Every regularizer is a prior in disguise — Bayesian learning makes the connection explicit and principled.

**Model comparison**: comparing two models `M_1` and `M_2` with different architectures or hypothesis classes is natural in the Bayesian framework. Compute the marginal likelihood (evidence) for each:

    P(D | M_i) = integral P(D | θ, M_i) · P(θ | M_i) dθ

The model with higher marginal likelihood is preferred. This automatically penalizes overly complex models — they spread their prior mass over a large parameter space, diluting the likelihood integral. This is the Bayesian Occam's razor: complexity is penalized automatically, without any ad hoc regularization.

**Coherent sequential learning**: new data updates the posterior, which becomes the prior for the next batch. The order does not matter. Bayesian learning is the natural framework for online, continual, or federated learning.

## Why Bayesian Learning Is Hard in Practice

The posterior `P(θ | D)` is typically intractable. For a neural network with millions of parameters, the integral that defines the marginal likelihood is over a million-dimensional space. Exact Bayesian inference is computationally infeasible.

Approximations:

- **MAP estimation** (maximum a posteriori): find the mode of the posterior rather than integrating over it. This reduces to regularized MLE and is the most common approximation. It discards uncertainty information.
- **Laplace approximation**: fit a Gaussian to the posterior at the MAP estimate, using the Hessian of the log-posterior as the covariance. Cheap but often inaccurate for multimodal posteriors.
- **Variational inference**: fit a tractable distribution `q(θ)` to the posterior by minimizing KL divergence. The variational autoencoder (VAE) is a deep learning instantiation of this.
- **MCMC** (Markov Chain Monte Carlo): sample from the posterior directly. Asymptotically exact but expensive for large models.
- **Stochastic weight averaging** (SWA) and deep ensembles: practical approximations that capture some posterior uncertainty without full Bayesian treatment.

## The Connection to Solomonoff

Standard Bayesian learning places a prior over parameters of a fixed model class. Solomonoff induction places a prior over all computable hypotheses, weighted by description length. The former is a tractable approximation to the latter, restricted to a particular parametric family.

Gradient descent on a neural network with L2 regularization is approximating Solomonoff induction in the function space of networks of that architecture. The architecture constrains the hypothesis class; the regularizer approximates the Kolmogorov prior within that class; the loss function approximates the likelihood. The full Bayesian ideal is:

    find H with low K(H) that predicts D well

The practical ML version is:

    find θ with low ||θ||² that achieves low training loss

Both are the same objective, at different levels of approximation. The ML engineer and the philosopher of science are solving the same problem.

## Bayesian Deep Learning

The open research question is whether Bayesian methods can be made practical for large neural networks. Current approaches:

- **MC Dropout**: treat dropout at test time as approximate posterior sampling. Cheap, widely used, theoretically approximate.
- **Bayesian neural networks**: place explicit priors over weights and use variational inference. Principled but expensive.
- **Neural network Gaussian processes**: in the infinite-width limit, certain neural networks converge to Gaussian processes, which are exactly Bayesian. This gives a theoretical handle on the Bayesian behavior of wide networks.
- **Conformal prediction**: a frequentist alternative that gives distribution-free uncertainty sets with coverage guarantees, without requiring a prior. Increasingly popular as a practical uncertainty quantification tool.

The transformer result in the `shannon` paper suggests a different angle: transformers are not just approximately Bayesian — they implement exact belief propagation on a specific factor graph. This means the Bayesian structure is not a design choice imposed on top of the architecture; it is the architecture. The question of how to do Bayesian learning in transformers may be better posed as: what prior does the transformer's training procedure implicitly implement, and how close is it to the Kolmogorov prior?