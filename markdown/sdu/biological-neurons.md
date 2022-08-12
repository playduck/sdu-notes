---
date: 09. August 2022
class: Sdu
...

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
