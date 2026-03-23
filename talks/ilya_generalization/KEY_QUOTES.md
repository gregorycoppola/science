# Key Quotes: "An Observation on Generalization"

Passages from the transcript organized by theme, with timestamps.
Full transcript in `transcript.txt`.

---

## On the Mystery of Unsupervised Learning

> "You optimize one objective but you care about a different objective and yet it
> helps. How can that be? Magic."
— 10:20

> "It seems totally like a totally inaccessible phenomenon. You optimize one
> objective but you care about another objective and yet it helps. How can that be?"
— 09:55

> "I have not seen an exposition of unsupervised learning which I found satisfying —
> how to reason about it mathematically. We can reason about it intuitively but can
> we reason about it mathematically?"
— 07:54

---

## On Compression as the Foundation

> "Compression is prediction. Every compressor can be a predictor and vice versa.
> There is a one-to-one correspondence between all compressors and all predictors."
— 15:05

> "A really great compression algorithm applied to the concatenation of X and Y —
> it will use the patterns that exist inside X to help it compress Y and vice versa."
— 16:14

> "The gap is the shared structure or the algorithmic mutual information. That's
> interesting right? You can see what I'm alluding to — Y is the data of your
> supervised task, X is your unsupervised task — but suddenly you have some kind
> of mathematical reason for the information for the patterns in X to try to help Y."
— 17:08

---

## On Kolmogorov Complexity

> "Kolmogorov complexity is the kind of thing which is easy to explain in one minute.
> It's like imagine if I give you some data and I'm going to compress it by giving
> you the shortest program that can possibly exist — the shortest program which if
> you run it outputs your data."
— 21:19

> "The Kolmogorov compressor if you use that to compress your strings you'll have
> very low regrets about your compression quality."
— 22:28

> "Conditional Kolmogorov complexity as the solution to unsupervised learning — you
> can sleep very very soundly at night knowing that no one does unsupervised learning
> better than you. It's literally that."
— 26:57

---

## On SGD as Program Search

> "Did you know that if you run SGD over the parameters of some neural net with 100
> layers it's like automatically doing program search over a computer which has a
> certain amount of memory, a certain number of steps? It's kind of like micro micro
> micro Kolmogorov. You kind of feel the similarity. It's kind of magical right."
— 24:15

> "Neural networks can simulate little programs. They are little computers. Circuits
> are computers. Computing machines. And SGD searches over the program and all of
> deep learning hinges on top of the SGD miracle that we can actually train these
> computers. SGD works, actually finds those circuits from data. Therefore we can
> compute our miniature Kolmogorov compressor."
— 24:44

> "SGD over big neural networks is our big program search. Bigger neural networks
> approximate the Kolmogorov compressor more and more and better and better. And so
> maybe this is also why we like big neural nets — because we approach the
> unapproachable idea of the Kolmogorov compressor which truly has no regret."
— 30:29

---

## On the Simulation Argument

> "The simulation argument: if you tell me hey I've got this really great compressor
> C, I'm going to say cool, does it come with a computer program? Can you give this
> computer program to K? And K is going to run your compressor because it runs
> computer programs. You just need to pay for the program length."
— 22:57

> "Why is it hard to find a better neural network architecture? The simulation
> argument. Because your new architecture can be pretty straightforwardly simulated
> by old architecture — except when it can't. Those are rare cases. And in those
> rare cases you have a big improvement, such as when you switch from the RNN to
> the Transformer."
— 25:16

---

## On Joint Compression = Maximum Likelihood

> "Joint compression is maximum likelihood if you don't overfit. If you have a
> dataset then the sum of the likelihood given your parameters is the cost of
> compressing the dataset. You also need to pay the cost of compressing the
> parameters."
— 29:42

> "This concatenation, this joint compression, is very natural in a machine learning
> context. If you now want to compress two datasets — no problem — just add more
> points to your training set."
— 30:04

> "If you squint hard enough you can say that this explains what our neural networks
> are doing. SGD over big neural networks is our big program search. Bigger neural
> networks approximate the Kolmogorov compressor more and more."
— 30:29

---

## On the Limitations

> "This theory has a huge practical weakness which is it ignores compute cost. It
> only focuses on information."
— 48:11

> "It doesn't say why your representations should be linearly separable. It doesn't
> say what linear probing should happen."
— 35:17

> "The analogy isn't perfect. The place where the analogy breaks down the most is
> in the search procedure. The Kolmogorov compressor uses the infinitely expensive
> search procedure of just enumerate everything from scratch each time."
— 39:24

---

## On Why Bigger Models Generalize Better

> "We approach the unapproachable idea of the Kolmogorov compressor which truly has
> no regret and we just want to have less and less regret as we train larger and
> larger neural nets as far as extracting predictive value is concerned."
— 30:50

> "You want your neural net to have many layers — if you have many layers it can do
> more thinking. You want those layers to be wider, bigger. Bigger neural nets.
> Essentially this is like what the field already discovered."
— 47:45