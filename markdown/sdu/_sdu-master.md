---
date: 13 August 2022
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

where $b$ is **bias** and $S$ the **slope**.
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

## Convolutional neural networks

Hereby:

- $u$: Input
- $v$ Output
- $x$ Hidden layer
- $w$ Weight from $u$ to $x$
- $y$ Weight from $x$ to $v$

One **Iteration** consists of one forward pass and one backwards pass.
One **Epoch** consists of **Iterations** for all Items in the training set.

### Forward propagation

1. Set input
2. Calculate for all hidden layers  $$x_j = \sum_i u_i w_{ji}$$
3. Calculate for all output layers  $$v_k = \sum_j x_j w_{kj}$$

### Backpropagation

1. Calculate error gradient for all output neurons  $$E_k^0 = v_k (1-v_k)(t_k-v_k)$$
2. Calculate error gradient for hidden layers       $$E_j^h = x_j(1-x_j) \sum_k E_K^0 y_{kj}$$
3. Update weights for outputs                       $$y\prime_{kj} = y_{kj} + \mu E_k^0 x_j$$
4. Update weights for hidden layers                 $$w\prime_{ji} = w_{ji} + \mu E_j^h u_i$$

## Vanishing Gradients

With a great amount of layers the impact of early neurons (close to the input) have less effect on the output error and get changed less resulting in less learning.
A high amount of layers does not guarantee better network performance.

**Dropout** randomly disables neurons and stops updating their weights.
This does not guarantee better accuracy only better execution speed.

This only occurs by learning with backpropagation.

Alternative: **NEAT** (*Neuroevolution of augmenting topologies*) using generative algorithms.
Possibly (not guaranteed) better performance to optimize output by chaning the entire networks structure.
Worst execution speed and memory performance.

## Trainig proceedure

Split trainig dataset into two parts to avoid overfitting.
Suggested split:

- $70\%$ training data
- $30\%$ testing data

Initilize weights to random values.

- **Training Datasset**: Adjust weights/learn
- **Testing Dataset**: Testing final solution
- **Validation Dataset**: Minimize overfitting

Always randomize oder of data for every **epoch**, as netoworks easily learn patterns.

More complex splitting algorithms and procesdures:

- **Monte Carlo corss validation** subsamples data randomly into its sets.
- **K-fold corss validataion** divides data into $k$ subsets, trainig it and removing it after training to repeat with the remaining $k-1$ subsets
- **Leave-p-out cross validation** $p$ datasamples, use $n-p$ for training, but test and train $\frac{n!}{p!\cdot (n-p)!}$ times. This presents every datapoint equally often and fairly.

# Questions \& Answers

## Biologically inspired robotics
- *What is biologically-inspired robotics?*

    Using biological systems as inspiration for robotic design.

- *What is biorobotics?*

    Using the biologically inspired robotic system to better understand the original biological system.

- *What is the difference between biorobotics and biologically-inspired robotics?*

    Biorobotics combines existing biological systems with mechanical systems.
    Biologically-inspired robotics takes inspiration of biological systems for robotics without combining the two. **(?)**

- *What is the reality check in biorobotics?*

    Complex biological behaviour doesn't arise from complex systems but rather simple, yet dedicated, systems.

- *What is neurorobotics?*

    The study and application of science and technology of embodied, autonomous, brain-inspired algorithms.

- *What is a neurorobot? Can you give an example of a neurorobot?*

    **(?)**

- *What is embodied AI?*

    A purpose built mechanical system in conjunction with an AI controller.

- *Can you explain the three-layer embodied AI architecture?*

    - The controller acting as a supervisor: The brain
    - The mechanical input and outputs: Motors and Sensor
    - The environment

- *Can you give an example of embodied AI in humans/animals? Can you give an example of embodied AI in robots?*

    **(?)**

- *Why is the environment important in embodied AI?*

    An enviornment influences an agent.
    An agent must overcome external influences or take advantage of them.
    Example: Seagulls in hovering in gusts of wind without effort.

- *What are model-based and model-free approaches in biorobotics? Can you use both together in one robot? Can you give an example?*

    - **Model based**: A mathematical model defines the entire robotic system.
    - **Model free**: The robot acts according to some defined rules but "figures out" how to achive it's objective by itself.

    Both appoaches can be used together. A model-based approach defining the systems baseline behviour with the model-free system adapting to external changes.

    Examples:
        - **Model based**: PID Controller
        - **Model free**: **(?)**
        - **Both**: **(?)**

## Neurons

- *What is a neuron?*

    A biological braincell responsible for processing.

- *What are the different types of neurons?*

    - **Unipolar**: Inputs, from outside the brain (found in insects)
    - **Bipolar**: Inputs, from senses (eyes, ears)
    - **Multipolar**: Within the brain and as outputs to muscles
        - **Pyramidal**: complex though (Cerebrum)
        - **Purkinje**: reactive action (Cerebellum)

- *How does a neuron work/transmit a signal through itself?*

    Using electrical spikes, presumeably through the spike signal's frequency and timing charachteristics, not by it's shape, amplitude or phase. **(?)**

- *How does a neuron forward a signal to other neuron(s)?*

    By using chemical reactions at synapses.

- *What is a synapse?*

    A non-physical connection between two neurons.

- *How does a synapse transmit a signal?*

    The electric signal in the pre-synaptic neuron releases neurotransmitters into the synaptic chasm.
    These travel through the brain fluid to the post-synaptic neurons neuroreceptors.
    If enough receptors get stimulated they create an electric spike.

- *What is an action potential?*

    A group of various electric signals collected by a neuron. **(?)**

- *Describe how an action potential is generated.*

    By the neuroreceptors in the post-synaptic neuron.

- *Describe how the different phases of the action potential are generated.*

    - The **resting phase** is the default state.
    - The **depolarization phase** occurs once the $Na+$ gates reach a voltage-threshold. A voltage overshoot occurs as reactions are not instantenous.
    - The **repolarization phase** follows showing a decline in voltage as the Sodium gates saturate and repell ions, thus allowing Potassium ($K+$) to enter.
    - The **hyperpolarization phase** returns to the resting state as the voltage reaches an equilibrium.

- *What is resting potential/depolarisation/repolarisation/hyperpolarisation? What mechanism(s) causes each phase to be generated?*

    **See above answer**.

- *Why is the resting potential negative?*

    As ions leak through the neurons membrane the neuron takes on a more negative charge in respect to the outside fluid.

- *How is information encoded in spikes?*

    Presumeably in its frequency and timing charachteristics.

- *What is a perceptron?*

    A quantized model of a neurons behavior.
    Consisting of multiple weighted inputs getting summed and passed through an activation function.

- *What is an activation?*

    The activation describes the weighted sum of the perceptrons inputs.
    $z = \sum_{i=1}^n \omega_i \cdot u_i$

- *What is an activation function? Why do we need it/What will happen if I don't use it?*

    A mathematical function limiting the perceptrons activation (weighted sum) to a knwon output space.

- *What are the different types of activation functions and their advantages/drawbacks? Which one will you choose and why?*

    \begin{align*}
    \text{RelU } &= \begin{cases} 0 \text{ for } x < 0\\ x \text{ for } x \geq 0\end{cases}\\[2ex]
    \text{Heaviside } &= \begin{cases} 0 \text{ for } x < 0\\ 0.5 \text{ for } x = 0\\ 1 \text{ for } x > 0\end{cases}\\[2ex]
    \text{Linear } &= x\\
    \text{Sigmoid} &= \frac{1}{1+e^{-x}}
    \end{align*}

    - Heaviside limits the output to a binary state, severly reducing granularity.
    - Linear and RelU are computationally efficient but may grow unbounded.
    - Sigmoids limit the effective range and don't quantize dramatically.

- *Why do we use a sigmoid activation function (think about it from both computer implementation and biology perspectives)?*

    It binds the output to a manageable range which avoids overflow and offers great precicion using IEE754.
    It also models neuron's own saturation.

- *What is the basic difference between biological neural processing and artificial neural processing?*

    Biological neural processing can operate many billions (or more) neurons in parallel. Computing with artifical neurons cannot currently achieve this.

- *What is a Hodgekin-Huxley model? What similarities/dissimilarities does it have with a biological neuron? What drawbacks does it have in terms of implementation?*

    An electronic circuit aiming to reproduce neurons' voltage spikes.
    It models different Ion-charges and resistances using batteries and resistors acting upon a cpacitor and receiving an external input.

    The model only offers one input.
    It breaks down with too-high currents failing to simulate accordingly.

    It's implementation is computationally incredibly expensive requring mutliple equations to be evaluated for every timestep of the voltage signal.

## Braitenberg vehicles

- *What is a Braitenberg vehicle? Can you give an example of one and how it behaves?*

A simple concept of a neurorobot consisting of two powered wheels receiving input from two sensors placed at the top left and right of the vehicle.
The connections between the sensors and wheels dictate the vehicles emerging behaviour.

An agressive vehicle features **contralateral** and **excitatory** connetions and agressively manouvers towards the sensor's gratests stimulus.
The \glqq love\grqq vehicle consists of **ipsilateral** and **inhibitory** connections resulting in it seeking the source of gratests stimulus but slowly coming to a halt when approaching it.

- *Are there any advantages of using Braitenberg vehicles?*

Their rather complex behavior emerging from very simplistic rules make them computationally trivial.

They enable emulating behaviors of simple insects.

## Learning



- *What is neuroplasticity? What types of neuroplasticity are there?*



- *What is structural/functional plasticity? What are the differences between the two?*



- *Can you give an example of structural/functional plasticity?*



- *What is Long Term Potentiation? What is Long Term Depression? Can you say something about the chemical process and any changes underlying LTP and LDP?*



- *What is Hebbian learning? What are its drawbacks as a model for learning?*



- *What is Spike-Timing Dependent Plasticity?*



- *Do you know other forms of functional plasticity?*



- *What type of plasticity is Hebbian learning (homo-, hetero-, non- *or homeostatic)?*



- *What is ICO learning? What type of synaptic plasticity is it and why? Can you give an example of how ICO learning can be used in robots?*



- *How do perceptrons learn? What is the fundamental difference between ICO learning and perceptron learning (think in terms of how gradient descent works vs how the ICO learning rule works)?*



- *What is a Multi-Layer Perceptron (MLP)?*



- *What is the backpropagation algorithm and how does it work? Why is it called a gradient descent method?*
