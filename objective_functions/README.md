# Objective Functions for Science

What is science optimizing for?

This directory develops the answer at increasing levels of formality — from etymology and philosophy to the precise mathematical statement. The intended audience is someone comfortable with the idea of an objective function from machine learning, who wants to understand what the *right* objective function for science actually is.

The short answer: it is the Bayesian update rule with the Kolmogorov/Solomonoff prior. This is not a new proposal — it is a formal statement of what science has always been doing informally.

## Contents

- `ETYMOLOGY.md` — what "objective" actually means, and why the word earns both of its senses at once
- `BAYES_KOLMOGOROV.md` — the formal objective function: Bayes + Kolmogorov = Solomonoff induction = MDL
- `VERIFICATION.md` — the search/verify asymmetry; how to check that a new claim advances the objective
- `HISTORY.md` — how science has approximated this objective function without writing it down