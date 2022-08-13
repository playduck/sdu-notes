---
date: 13. August 2022
class: Sdu
...

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
