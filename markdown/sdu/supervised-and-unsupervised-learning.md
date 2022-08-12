---
date: 12. August 2022
class: Sdu
...

# Supervised \& unsupervised learning

## Non-linear actiavtion function

**Bias** is activation function x-Offset
**Slope** of activation function is rarely used.

An example sigmoid with **bias** and **slope**.
$$v =  \frac{1}{1+e^{-S(z-b)}}$$

where $b$ is **bias** and $S$ s the **slope**.
**Bias** can be used as a weight.

\begin{align*}
z &= w_1u_1 + w_2u_2 + \ldots + w_nu_n \\
& \rightarrow (z-b) = w_1u_1 + w_2u_2 + \ldots + w_nu_n - b\\
& \rightarrow (z-b) = w_1u_1 + w_2u_2 + \ldots + w_nu_n - (b-1)\\[2ex]
\rightarrow & (b-1) \text{ splits to } w_{n+1} \text{ and } u_{n+1}
\end{align*}

This results in an additional weighted bias shifting the activation function resulting in
$$z = \sum_{i=1}^{n+1}\omega_i \cdot u_i$$

Each perceptron can implement one **deciscion boundary**.
**Deciscion boundaries** seperate inputs into different classes.
The boundary can be shifted by adapting the weights.

By adding more perceptrons the **deciscion boundaries** dimension increases.
The boundry of 2 neurons results in one-dimensions.
3 Neurons create a 2-Dimensional **deciscion boundary**.
More Neurons build more complex spaces.

## Designing a network

- Defined number of inputs
- Defined number of outputs
- Variable hidden layers

Hidden layer depends on linearity of the problem.
No general solution to amount of hidden layers.
Strategy of trial and error, start with $\approx 100$ layers.

**Deep Neural Networks**: Depth is defined horizontally.
