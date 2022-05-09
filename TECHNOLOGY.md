# Used Machine-Learning Frameworks

-   ComputerScience-Part: [PyTorch](https://pytorch.org/tutorials/)
-   Physics-Part: [JAX](https://github.com/google/jax) ("numpy on GPU with differentiation")
    -   Will use [Flax](https://github.com/google/flax)

The Neural Networks will be designed in JAX and then be transformed to JAX/Flax for use by the Physics department.

# Used Physics Software

-   Planned to be used, now just as a reference: [NetKet3](https://www.netket.org/)
    -   See reference Paper: _NetKet 3 Machine Learning Toolbox for Many-Body Quantum Systems_
-   Going to be used now: [jVMC](https://github.com/markusschmitt/vmc_jax)
    -   Implements _Variational Monte Carlo_ with [JAX](https://jax.readthedocs.io/) and [Flax](https://flax.readthedocs.io/)

# Used Technological Concepts

-   [Graph Neural Networks](https://en.wikipedia.org/wiki/Graph_neural_network)
    -   Will be implemented in PyTorch /JAX to begin with
    -   For performance/cleanliness port to [Jraph](https://github.com/deepmind/jraph) possible
    -   Provides the capabilities to define the weights of the neighbor interactions (nearest, next-nearest, etc.) in a clean matrice-driven way.
-   [Transformer-Architecture](<https://en.wikipedia.org/wiki/Transformer_(machine_learning_model)>)
    -   "Backbone" of the ML-Model. Provides most of the ML-logic
    -   Idea: Think about pre-training
    -   Idea: Think about differentiated activation functions to try to make sense of/acquire an analytical approach/solution instead of endlessly complex transformer logic
    -   Idea: Think about generalizing Networks to be able to learn independent of the problems dimension
-   [Residual Neural Networks](https://en.wikipedia.org/wiki/Residual_neural_network)
    -   May be used to allow for better training of the networks
-   Visualizing Large (Many-Dimensional) Datasets: [t-SNE](https://lvdmaaten.github.io/tsne/)

# Used Mathematical/Physics Concepts

-   Physics-Model used for representing the systems
    -   [Heisenberg-Model](https://en.wikipedia.org/wiki/Quantum_Heisenberg_model) (looked at first)
    -   [Ising-Model](https://en.wikipedia.org/wiki/Ising_model)
-   [Variational wave function](http://www.pci.tu-bs.de/aggericke/PC4/Kap_II/Variationsmethode.htm)
    -   parameterized Wave-Function $\rightarrow$ Hamiltonian
    -   Ground-State should give lowest Energy-Eigenvalue
    -   Find minimum of parameterization
    -   parameterization can be done with a neural-network, because of its excellent non-linear capabilities
-   [Monte Carlo Method](https://en.wikipedia.org/wiki/Quantum_Monte_Carlo)
    -   For [numerical Calculation of Integrals](https://en.wikipedia.org/wiki/Monte_Carlo_integration) by sampling random dots and calculating the ratio above/below the curve
    -   For Spin-System Sampling
        -   chose random spin configurations
        -   add them up to generate a superposition. Weight them according to the sampled energies, generation some kind of [Markov-Chain](https://en.wikipedia.org/wiki/Markov_chain) that prefers the more likely spin configurations to get to a ground-state-like superposition faster.
-   [Second Quantization](https://en.wikipedia.org/wiki/Second_quantization)
    -   TODO: get Explanation by Thilo Kopp about two Atoms and one Electron from Laurin
    -   "Rather than caring about total values, calculate the signs and ratios of the results"
    -   Express Quantum many-body state in Vector, Hamiltonian as a matrix
        -   Eigenvectors/Eigenvalues are the solution
        -   lowest Eigenvalue corresponds to the Ground state Energy
        -   Solutions
            -   [Diagonalize the Hamiltonian](https://en.wikipedia.org/wiki/Diagonalizable_matrix#Diagonalization) (too expensive calculations, because exponential complexity)
            -   [Power iteration](https://en.wikipedia.org/wiki/Power_iteration)
            -   _Variational Monte Carlo_ (this thesis)
-   [Universal Approximation Theorem](https://en.wikipedia.org/wiki/Universal_approximation_theorem)
    -   Idea: think of the theorem holding true for complex numbers
