---
date: 13. August 2022
class: Sdu
...

# Questions \& Answers

## Biologically inspired robotics
1. *What is biologically-inspired robotics?*

    Using biological systems as inspiration for robotic design.

1. *What is biorobotics?*

    Using the biologically inspired robotic system to better understand the original biological system.

1. *What is the difference between biorobotics and biologically-inspired robotics?*

    Biorobotics combines existing biological systems with mechanical systems.
    Biologically-inspired robotics takes inspiration of biological systems for robotics without combining the two. **(?)**

1. *What is the reality check in biorobotics?*

    Complex biological behaviour doesn't arise from complex systems but rather simple, yet dedicated, systems.

1. *What is neurorobotics?*

    The study and application of science and technology of embodied, autonomous, brain-inspired algorithms.

1. *What is a neurorobot? Can you give an example of a neurorobot?*

    A breitenberg vehicle.

1. *What is embodied AI?*

    A purpose built mechanical system in conjunction with an AI controller.

1. *Can you explain the three-layer embodied AI architecture?*

    - The controller acting as a supervisor: The brain
    - The mechanical input and outputs: Motors and Sensor
    - The environment

1. *Can you give an example of embodied AI in humans/animals? Can you give an example of embodied AI in robots?*

    **(?)**

1. *Why is the environment important in embodied AI?*

    An enviornment influences an agent.
    An agent must overcome external influences or take advantage of them.
    Example: Seagulls in hovering in gusts of wind without effort.

1. *What are model-based and model-free approaches in biorobotics? Can you use both together in one robot? Can you give an example?*

    - **Model based**: A mathematical model defines the entire robotic system.
    - **Model free**: The robot acts according to some defined rules but "figures out" how to achive it's objective by itself.

    Both appoaches can be used together. A model-based approach defining the systems baseline behviour with the model-free system adapting to external changes.

    Examples:
    3-D Printer controlling it's nozzle temperatur with a model (PID Controller) and minimizing motor vibrations using a learning algorithm.

## Neurons

1. *What is a neuron?*

    A biological braincell responsible for processing information.

    It consists of multiple Inputs (**Dendirtes**), one Output (**Axiom**) and it's core, the **Soma**.

1. *What are the different types of neurons?*

    - **Unipolar**: Inputs, from outside the brain (found in insects)
    - **Bipolar**: Inputs, from senses (eyes, ears)
    - **Multipolar**: Within the brain and as outputs to muscles
        - **Pyramidal**: complex though (Cerebrum)
        - **Purkinje**: reactive action (Cerebellum)

1. *How does a neuron work/transmit a signal through itself?*

    Using electrical spikes, presumeably through the spike signal's frequency and timing charachteristics, not by it's shape, amplitude or phase. **(?)**

1. *How does a neuron forward a signal to other neuron(s)?*

    By using chemical reactions at synapses.

1. *What is a synapse?*

    A non-physical connection between two neurons.

1. *How does a synapse transmit a signal?*

    The electric signal in the pre-synaptic neuron releases neurotransmitters into the synaptic chasm.
    These travel through the brain fluid to the post-synaptic neurons neuroreceptors.
    If enough receptors get stimulated they create an electric spike.

1. *What is an action potential?*

    A spike signal input to a neuron.

1. *Describe how an action potential is generated.*

    By the neuroreceptors in the post-synaptic neuron.

1. *Describe how the different phases of the action potential are generated.*

    - The **resting phase** is the default state.
    - The **depolarization phase** occurs once the $Na+$ gates reach a voltage-threshold. A voltage overshoot occurs as reactions are not instantenous.
    - The **repolarization phase** follows showing a decline in voltage as the Sodium gates saturate and repell ions, thus allowing Potassium ($K-$) to enter.
    - The **hyperpolarization phase** returns to the resting state as the voltage reaches an equilibrium.

1. *What is resting potential/depolarisation/repolarisation/hyperpolarisation? What mechanism(s) causes each phase to be generated?*

    **See above answer**.

1. *Why is the resting potential negative?*

    As ions leak through the neurons membrane the neuron takes on a more negative charge in respect to the outside fluid.

1. *How is information encoded in spikes?*

    Presumeably in its frequency and timing charachteristics.

1. *What is a perceptron?*

    A quantized model of a neurons behavior.
    Consisting of multiple weighted inputs getting summed and passed through an activation function.

1. *What is an activation?*

    The activation describes the weighted sum of the perceptrons inputs.
    $z = \sum_{i=1}^n \omega_i \cdot u_i$

1. *What is an activation function? Why do we need it/What will happen if I don't use it?*

    A mathematical function limiting the perceptrons activation (weighted sum) to a knwon output space.

1. *What are the different types of activation functions and their advantages/drawbacks? Which one will you choose and why?*

    \begin{align*}
    \text{RelU } &= \begin{cases} 0 \text{ for } x < 0\\ x \text{ for } x \geq 0\end{cases}\\[2ex]
    \text{Heaviside } &= \begin{cases} 0 \text{ for } x < 0\\ 0.5 \text{ for } x = 0\\ 1 \text{ for } x > 0\end{cases}\\[2ex]
    \text{Linear } &= x\\
    \text{Sigmoid} &= \frac{1}{1+e^{-x}}
    \end{align*}

    - Heaviside limits the output to a binary state, severly reducing granularity.
    - Linear and RelU are computationally efficient but may grow unbounded.
    - Sigmoids limit the effective range and don't quantize dramatically.

1. *Why do we use a sigmoid activation function (think about it from both computer implementation and biology perspectives)?*

    It binds the output to a manageable range which avoids overflow and offers great precicion using IEE754.
    It also models neurons' own saturation.

1. *What is the basic difference between biological neural processing and artificial neural processing?*

    Biological neural processing can operate many billions (or more) neurons in parallel. Computing with artifical neurons cannot currently achieve this.

1. *What is a Hodgekin-Huxley model? What similarities/dissimilarities does it have with a biological neuron? What drawbacks does it have in terms of implementation?*

    An electronic circuit aiming to reproduce neurons' voltage spikes.
    It models different Ion-charges and resistances using batteries and resistors acting upon a cpacitor and receiving an external input.

    The model only offers one input.
    It breaks down with too-high currents failing to simulate accordingly.
    The model only generates spikes and it's output is not generally useful for computing.

    It's implementation is computationally incredibly expensive requring mutliple equations to be evaluated for every timestep of the voltage signal.

## Braitenberg vehicles

1. *What is a Braitenberg vehicle? Can you give an example of one and how it behaves?*

    A simple concept of a neurorobot consisting of two powered wheels receiving input from two sensors placed at the top left and right of the vehicle.
    The connections between the sensors and wheels dictate the vehicles emerging behaviour.

    An agressive vehicle features **contralateral** and **excitatory** connetions and agressively manouvers towards the sensor's gratests stimulus.
    The \glqq love\grqq vehicle consists of **ipsilateral** and **inhibitory** connections resulting in it seeking the source of gratests stimulus but slowly coming to a halt when approaching it.

1. *Are there any advantages of using Braitenberg vehicles?*

    Their rather complex behavior emerging from very simplistic rules make them computationally trivial.

    They enable emulating behaviors of simple insects.

## Learning

1. *What is neuroplasticity? What types of neuroplasticity are there?*

    Neuroplasticity describes the ability of the brain to re-organize itself over time in order to learn.
    There is **structural** and **functional** neuroplasticity.


1. *What is structural/functional plasticity? What are the differences between the two?*

    - **Structural**: Major structural changes over long periods of time
    - **Functional**: Minor adaptions over short periods of time

    There are more biological mechanisms for **structural** than for **functional** changes.

1. *Can you give an example of structural/functional plasticity?*

    - **Structural**:
        - Synapses changing in number
        - Synapses receptors changing in density
    - **Functional**:
        - Synapses adjusting their strength (*synaptic plasticity*)

1. *What is Long Term Potentiation? What is Long Term Depression? Can you say something about the chemical process and any changes underlying LTP and LDP?*

    **LTP**: If the synapse is overstimulated for a long period of time (many pulses in quick succession, high frequency) the synapse will create more neural receptors and thus \glqq strengthen \grqq the conection. The *fEPSP* slope increases.

    **LTD**: If the synapse is, however, understimulated for a long time (very few pulses, low frequency), it will reduce the ammount of neuroreceptors at the post-synaptic neuron essentially \glqq weakening\grqq the conection. The *fEPSP* slope decreases.

    **(?)**

1. *What is Hebbian learning? What are its drawbacks as a model for learning?*

    \glqq Neurons that fire together, wire together \grqq

    It describes the likelyhood of a presynaptic neuron spiking and exciting it’s postsynaptic neuron.
    The likelyhood of the post-synaptic neuron firing after having been exicted is increased.
    More firing together $\rightarrow$ more likely to fire together in the future.
    They spiking is, however, **not necessarily causal**.
    At high efficiency the spiking of both neurons are **temporally correlated**.
    The spiking is **associative** and **unsupervised**.

    It's model is describes as
    $$\frac{\partial \omega_1}{\partial t} = \mu v u_1$$
    wherby the partial term $\frac{\partial \omega_1}{\partial t}$ may grow unbounded.
    As this control loop is unsupervised we can't stop the model once it's \glqq good enough\grqq.

1. *What is Spike-Timing Dependent Plasticity?*

    **STDP** describes neurons' change in synaptic weight in relation to **LT Potentiation** and **LT Depression**.
    This proves a biological basis for Hebbian learning, as neurons which have a strong temporal correlation have a realtively strong synaptic weight.

1. *Do you know other forms of functional plasticity?*

    - **Homosynaptic** plasticity: changes in synapse strength occur only at post-synaptic targets that are specifically stimulated by a pre-synaptic target.
    - **Heterosynaptic** plasticity: activity of a third neuron can releases chemical neuromodulators that induce changes in synaptic strength between two other neurons.
    - **Non-synaptic** plasticity: intrinsic excitability, i.e. sensitivity to synaptic input, of neurons can be altered and is manifested as changes in the firing characteristics of the neuron itself.
    - **Homeostatic** plasticity: capacity of neurons to regulate their own excitability relative to network activity, a compensatory adjustment that occurs over the timescale of days.

1. *What type of plasticity is Hebbian learning (homo-, hetero-, non- or homeostatic)?*

    Hebbian learning is **homosynaptic** plasticity. **(?)**

1. *What is ICO learning? What type of synaptic plasticity is it and why? Can you give an example of how ICO learning can be used in robots?*

    **Input correlation learning** (**ICO**) is **heterosynaptic** plasticity.

    The goal is to detect an event which triggers a reflex signal using a predictive signal (without even triggering the reflex).
    This is implemented using the correlation of these two (predictive and reflex signal).
    Implementing this requires a third neuron (one for each input and one additional neuron as output), thus **heterosynapsis** is required.

    Example:
    Detecting obstacles using a camera (predictive input) without triggering the bump sensor (reflex input).
    The robot can learn to avoid obstacles by using the camera only.

1. *How do perceptrons learn? What is the fundamental difference between ICO learning and perceptron learning (think in terms of how gradient descent works vs how the ICO learning rule works)?*

    - **ICO** learns by adapting the time between predictive input and reflex input (the correlation between those). This process is **unsupervised**.
    - **perceptrons** learn by adjusting their weight by trying to minimize some given error function. This requires an expected output and is **supervised**.

1. *What is a Multi-Layer Perceptron (MLP)?*

    An **MLP** is a neural network.
    It consists of an input layer, an output layer and a defined amount of fully convoluted hidden layers inbetween those two.

1. *What is the backpropagation algorithm and how does it work? Why is it called a gradient descent method?*

    Backpropagation describes the process of changing weights in accordance to their respective impact on the output error.
    An errorgradient is calculated for each output neuron and for each hidden layer up to the input.
    Based on this gradient each weight is adjusted accordingly.

    The gradient describes an $n$-dimensional vector pointing towards the steepest decent on the error manifold's surface.
    Decending this is called gradient decent.
