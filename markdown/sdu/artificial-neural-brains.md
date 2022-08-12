---
date: 10. August 2022
class: Sdu
...

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
