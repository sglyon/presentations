## A simple problem: McCall Search model


Now that we know what types are in Julia, let's create one to describe the McCall search model and hook it in to the `QuantEcon.jl` framework.

### The Model

I will give a *very breif* review of the McCall search model so we are all on the same page.

An unemployed worker searches for a job each period and receives an offer to work forever at a wage $w$, which has some distribution $F(w) = \text{prob} \{w < W \}$, with $F(0)= 0, F(B) = 1$ for $B < \infty$

Each period the worker is unemployed he receives unemployment benefits equal to $c$.

The worker seeks to maximize $\sum_{t=0}^{\inf} \beta^t y_t$, where $\beta \in (0, 1)$ is a discount factor and $y_t$ is the workers income in period $t$.

Let $v(w)$ be the value of our unemployed worker who is deciding whether to accept or reject an offer at wage $w$. We write $v(w)$ as

$$
v(w) = \max_{\text{accept, reject}} \left\{\frac{w}{1 - \beta}, \beta \int_0^{B} v (w'), dF(w')\right\}
$$
