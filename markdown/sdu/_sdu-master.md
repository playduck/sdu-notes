---
date: 12 August 2022
class: sdu
...

\tableofcontents

\clearpage
\newpage


# Intro

## Requirements

- Matlab (with Communications Toolbox)
- Putty / SSH Client
- 09:00 to (no later than) 17:00

## Overview

### Embodied AI

<!-- TODO: Add sections on:
- Embodied AI
- Enviornmental impact (pro/con)
 -->

# Biological-neurons

## Neurons

- **Dendrite(s)**: Input(s)
- **Axion**: Output
- **Soma**: Cell body
- **Nucleus**: Cell core

*Neurons* collect electrical signals to process and transmit to other *neurons*.
*Axon* terminals of one connect to *dendrites* of other *neurons*.
*Synapses* are structures to connect those electrically/chemically (however no physical connetion is made).

## Synapse

Electrical signal trasnission through Ion-filled Substrate.

- **Pre***synamptic neuron*: Sending Signals from Axiom
- **Post***synamptic neuron*: Receiving Signals at the Dendrite

Voltage changes open Voltage gates from the neural-fluid into the *presynaptic neuron*. This pulls in Ions from the neuralfluid maing *vesicles* release realese *neurotransmitteres* into the *synaptic cleft* to move between the *neurons*.
The *postsynaptic neuron* receives these trasmitteres into receivers and converts the chemical information to an electrical signal.

## Signals

\begin{figure}[htp]
\centering
\includegraphics[width=0.5\textwidth]{neuron-spike.png}
\caption{Neuron Spike}
\end{figure}

- *Resting* at $-70\si{mV}$
- *Depolarization phase*: Excitation from input signal reaching an artificial threshold resulting in a voltage jump (up to $+40\si{mV}$)
- *Repolarization phase*: Return to resting potential
- *Undershoot (Hyperpolarization)* return to resting.

All voltages with respect to outside brainfluid.

This process thakes around $3\si{ms}\ \left( 333.33\si{Hz} \right)$.
The *Myelin Sheaths* decreases performance and throughput aswell.
This is faster due to thight packing and parallel processing.

The spike is seemingly identical between different neurons (same Amplitude and timeframe).


### Resting membrane potential (default state)

Different ion concentration: more negative inside the neuron than outside.
Measurement in reference to outside.
Outside: Mostly $\mathit{Na}+$ and $\textit{Cl}-$.
Inside: $\mathit{K}+$ and $\mathit{A}-$.
Resting voltage sits at around $-65\si{mV} \text{ to } -70\si{mV}$.

### De-polarization

Ions flow through the neuron.
Signal excites gates.
Gates are ion-specific and only allow certain kinds of ions.
These are *voltage-gates channels*.

Ions like Sodium ($\mathit{Na}+$) enter the neuron resulting in a positive voltage swing up to $+40\si{mV}$.
Once all Sodium gates are open the threshold is reached.
The gates open with very little voltage.

### Hyper-polarization

Once the voltage between neuron and outside fluid is positive, the Sodium gates close (as they're voltage controlled).
Respectively the Potassium ($\mathit{K}+$) gates open.
Positive charge leaves the neuron making the voltage drop to below the threshold.
At resting potential the Potassium gates close.
Due to the delay in closure undershoot occurs.

### Encoding Information

Information is seemingly encoded in timeing between pulses.
Amplitudes and Durations of spikes are too simmilar between spikes.

## Artifical Neruons

### Perceptrons

A simple neural model.

All dendrites $u_i$ get weighted $w_i$ and summed resulting in the activation $z$.
The summation simulates the *soma* core.
$$z = \sum_{i=1}^{n} \omega_i \cdot u_i$$

The threshold and axiom are simulated by an activation function $\phi$ resulting in the *perceptrons'* output $v$.
$$v = \phi(z)$$

Activation functions tend to clamp the output in the range of $-1$ to $1$.

An activation function dictates the output space.
A heaviside function can only output a binary result.
Functions with infinite range may diverge.
Sigmoid functions can't overflow however the may saturate.
The computataional cost is quite prohibitive.

<!-- Is the sigmoid activation biologically inspired -->

### Hodgkin-Huxley Model

\begin{figure} [h]
\centering
    \begin{circuitikz}[]
    \draw (0,0) to [short, o-*] ++(0,1);
    \draw (0,7) to [short, *-o] ++(0,1);
    \draw (-3,7) -- (3,7);
    \draw (-3,1) -- (3,1);
    \draw (-3, 1) to[C] ++(0,6);
    \draw (-1, 1) to[C, *-] ++(0,3) to[R, -*] ++(0,3);
    \draw (1, 1) to[C, *-] ++(0,3) to[R, -*] ++(0,3);
    \draw (3, 1) to[C,] ++(0,3) to[R] ++(0,3);
    \end{circuitikz}
\caption{}
\end{figure}

# Artificial neural brains
## Braitenberg Vehicles

- **Ipsilateral**: Connections on same side
- **Contralateral**: Connections cross sides
- **Excitatory**: Input Increases \textrightarrow\ Output Increases
- **Inhibitory**: Input Increases \textrightarrow\ Output Decreases

Vehicle emulates simple $P$-type control.

Mathematical model includes:

- $s_x$: Sensor value
- $v_x$: Output value
- $k$: Linear proportional gain

Mathematical example implementations:

- **Ipsilateral**: $v_{\text{left}} \propto s_{\text{left}}$
- **Contralateral**: $v_{\text{left}} \propto s_{\text{right}}$
- **Excitatory**: $v \propto s$
- **Inhibitory**: $v \propto \frac{1}{s}$

**Pathplanning**: Finding path from known start to known end including known obstacles.

Complex behavior emerges by combining multiple weighted control loops running in parallel.

# Artificial learning

## Plasticity

**Neuroplasticity**: Ability for the brain to re-organize itself in both *structure* and *function* over time due to external and internal events.
**Neuroplasticity** is mechanism behind "*learning*" and is happening continuously.


| **Structural Plasticity** | **Functional Plasticity**     |
|:--------------------------|:------------------------------|
| new neural connections    | changing existing connections |
| long-term changes         | short term changes            |

**Plasticity** happens on all levels from cortical down to the synaptic level.

- **cortical**: changing stimulus from limbs triggers different existing neurons
- **synaptic**: changing amount of gates on post-synaptic neurons' dendrites


## **synaptic strength** in functional plasticity

### Long Term Potentiation (*LTP*)

**HFS**: $100$ Pulses (over $1\si{s} \rightarrow 100\si{Hz}$) as an input to a neuron.
The neuron is resting at $t=0$.
The **HFS** hits the neuron resulting in an instantaneous output, the **LTP**.
The neurons output jumps, then receedes and continues to saturate (Only as long as the **HFS** is continous.)
The **synaptic strength** is the chance the output is increased.

A lot of fast input $\rightarrow$ Big changes and high learning

**LTP *increases* synaptic strength**

### Long Term Depressino (*LTD*)

The Inverse, to decrease the **synaptic strength** an **LFS** ($900$ Pulses $15\si{min} \rightarrow 1\si{Hz}$) is sent.
The neuron responsds, dips and saturates in a depression.

Low data $\rightarrow$ Low learning

**LTD *decreases* synaptic stregth**

### Chemical basis

**LTP** and **LTD** result in synapeses by creating or destroying gates at the pos-synaptic terminal respectively.

## Hebbian learning model

Efficiency describes the likelyhood if a presynaptic neuron spiking and exciting it's postsynaptic neuron.
The likelyhood of the post-synaptic neuron firing after having been exicted is increased.
More firing together $\rightarrow$ more likely to fire together in the future.
They spiking is, however, *not necessarily causal*.
At high efficiency the spiking of both neurons are **temporally correlated**.
The spiking is **associative** and **unsupervised**.

**Neurons that fire together, wire together.**

### Simple mathematical model

$$\frac{\mathit{d}\omega_1}{\mathit{d}t} = \mu \cdot v \cdot u_1$$

- $\omega$: dsecribes the synaptic strength / weight
- $\frac{\mathit{d}\omega_1}{\mathit{d}t}$: (not a derivative), Change in synaptic weight
- $\mu$: Learnig rate ($\mu \ll 1$ to avoid "exploding learning problem")
- $v$: Output of post-synaptic neuron
- $u_1$: Output of pre-synaptic neuron / input to post-synaptic neuron

$$\omega_n = \omega_{n-1} + \frac{\mathit{d}\omega_{n-1}}{\mathit{d}t} = \omega_{n-1} + \mu \cdot v \cdot u_{n-1} $$

**Problem**: $\omega_1$ is always increasing, unstable ~~but biologically correct~~. This is an open control loop.

As this is unsupervised we don't have an error term and can't simply stop when the model is "good enough".

### LTP

The further the amount of time between two spikes firing the more the weight changes.
A high $\delta t$ results in little change, a small $\delta t$ results in large changes.
At $\delta t = 0$ maximal change occurs.
The simple model only results in positive change, thus unstable.

<!-- ### Spike timing depndent plasticity (*STDP*) -->

## Input correlation learning (*ICO*)

Learning rule
$$\frac{\delta w_a}{\delta t} = \eta \cdot f \left( A, t\right) \otimes \frac{\delta f \left( B, t\right) }{\delta t}$$

- $\eta$: learning rate
- $f\left( A, t\right) \otimes \frac{\delta f \left( B, t\right) }{\delta t}$: Temporal correlation
- $otimes$: cross correlation
- $A$: Predictive signal
- $B$: Reflex signal
- $Y$: Neuron Ouput
- $w_a$ weight between $A$ and $Y$
- $f$ output function of a neuron (including the sigmoid)

If we'd like to stop the learning we can assume $B$ to be constant.
We cannot guarantee $B \rightarrow 0$ (to stop learning) but we can take the derivative to stop learning once stimulus ceases change.

This Algorithm **will converge** to the correct weight.

Output signal is the weighted sum.
$$Y(t) = w_a \cdot f \left( A, t\right) + f \left( B, t\right)$$

### Perceptron learning

Learning by updating input weights only.
Update done using **gradient descent**.

Update weight in proportion to contribution to the output.
Contribution is the change in error $E$ für a given change in $w$, where the mean squared error is defined as
$$E = \frac{1}{2} \left( t-v\right)^2$$

- $t$: target output
- $v$: actual output

Determining error requires a known correct output.

$\rightarrow$ **supervised learning**


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
