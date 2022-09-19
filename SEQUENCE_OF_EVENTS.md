# Pre-Start events

-   [x] Meet with Daniel to talk about general theme of the thesis
-   [x] Meet with Prof. Lienhart and Daniel to get confirmation for the work together
-   [x] Meet with both Professors and all three Supervisors for official start of work
-   [x] Meet with Daniel for Computer-Science pre-briefing, management and time-scope
-   [x] Meet with Laurin and Tobias for Physics pre-briefing, management and time-scope
-   [x] Complete full scope of expectations document (Erwartungshorizont)

# Month 1

-   [x] Get the ImageNet training data into a usable form
    -   [x] reduce from 1000 classes to 100 classes
    -   [x] get formatted to be able to train a model in a efficient manner
    -   [x] Seeding and seed logging for training
    -   [x] add top 3/5 accuracy to results
-   [x] implement a (vision-) transformer architecture after the [DINO](https://github.com/facebookresearch/dino) implementation (`vision_transformer.py`)

    -   [x] play with parameters
        -   [x] converged on using the `vit_tiny` version

-   [x] Modify the structure of the Metaformer

    -   [x] Ability to toggle downstream Graph element (after token mixer, before softmax/layernorm)
        -   look at the [Swin-Transformer](https://github.com/microsoft/Swin-Transformer) implementation for implementation details concerning the adjacency matrix
        -   [x] implement creation of Graph element filter matrix
        -   [x] use Graph element in the architecture
    -   [x] customize, to be able to replace parts of the architecture

        -   [x] Default Attention based Metaformer (Transformer)
        -   [x] Metaformer with Pooling as a Token Mixer (Poolformer)
            -   look at the [PoolFormer](https://github.com/sail-sg/poolformer) implementation for implementation details and Metaformer Motivation
        -   [x] Metaformer with Convolutions as Token mixers
            -   [x] Separate by weight distribution
                -   Classical Convolution (fully asymmetrically trainable filter weights)
                    $$
                    \left(\begin{matrix}
                        w_\text{1} && w_\text{2} && w_\text{3}\\
                        w_\text{4} && w_\text{0} && w_\text{5}\\
                        w_\text{6} && w_\text{7} && w_\text{8}\\
                    \end{matrix}\right)
                    $$
                -   Symmetric Convolution (only symmetrically trainable filter weights)
                    -   Only NN (two weights per channel)
                        $$
                        \left(\begin{matrix}
                            0 && w_\text{NN} && 0\\
                            w_\text{NN} && w_\text{0} && w_\text{NN}\\
                            0 && w_\text{NN} && 0\\
                        \end{matrix}\right)
                        $$
                    -   NN and NNN (three weights per channel)
                        $$
                        \left(\begin{matrix}
                            w_\text{NNN} && w_\text{NN} && w_\text{NNN}\\
                            w_\text{NN} && w_\text{0} && w_\text{NN}\\
                            w_\text{NNN} && w_\text{NN} && w_\text{NNN}\\
                        \end{matrix}\right)
                        $$

    -   [x] Full list of Metaformer-Architectures
        -   Attention Based
            -   default (Vision-) Transformer **(TF)**
            -   Graph (Vision-) Transformer NN **(GTF-NN)**
            -   Graph (Vision-) Transformer NNN **(GTF-NNN)**
        -   Not Attention Based
            -   Poolformer **(PF)**
            -   Graph Poolformer NN **(GPF-NN)**
            -   Graph Poolformer NNN **(GPF-NNN)**
            -   Convolution Architectures (Graph and non-graph variants should have identical outputs, but Graph is more versatile in practice and convolution more efficient)
                -   Classical d(epthwise)Conformer **(DCF)**
                -   Symmetric d(epthwise)Conformer NN **(DCF-NN)**
                -   Symmetric d(epthwise)Conformer NNN **(DCF-NNN)**
                -   Symmetric Graph-d(epthwise)Conformer NN **(SDCF-NN)**
                -   Symmetric Graph-d(epthwise)Conformer NNN **(SDCF-NNN)**
        -   Not comparable architecture (Has non-transformer-architecture computing capabilities)
            -   Conformer **(CF)**
            -   Symmetric Conformer NN **(SCF-NN)** (not implemented)
            -   Symmetric Conformer NNN **(SCF-NNN)** (not implemented)

-   [x] test training on the image data
    -   IMPORTANT: train everything the same way, do not produce optimal results, but comparable results
    -   [x] try the training on the standard image-optimized architectures (same as DINO transformer)
    -   [x] real training pass on the modified architectures
        -   [x] compare main architectures against each other
        -   [x] on interesting cases compare modifications of one architecture
            -   different optimizers / learning rates
            -   different positional encoding
-   [x] ~~if there is time remaining, try testing on the graph dataset [NCI1](https://paperswithcode.com/dataset/nci1)~~
-   [x] ~~if there is time remaining, visualize attention heatmaps~~

# Month 2

-   [x] carry the learned information over to JAX
    -   Either:
        -   [x] Directly in JAX
            -   supported by [Flax](https://github.com/google/flax)
        -   ~~By using the [Jraph](https://github.com/deepmind/jraph) library~~
-   [x] Train/Compute on JAX-Jsing Model

    -   [x] ~~Everything should be implemented already, drop in possibility for own network~~
    -   [x] Implement a suited `ground-state-search` (use [ex0_ground_state_search.py](https://github.com/markusschmitt/vmc_jax/blob/master/examples/ex0_ground_state_search.py) as an example)
        -   [x] perform ground-state-search in general
        -   [x] get the input-index-interactions for the hamiltonian sorted
            -   [x] visualization
            -   [x] random mixing
        -   [x] tensorboard logging
            -   [x] default sizes obvious for learning/training (Energy, variance)
            -   [x] log hyperparameters for better evaluation later on
            -   [x] measure observables (magnetization in al directions)
            -   [x] quantum-fisher-information as a histogram
    -   [x] implement the metaformer models used/examined
        -   [x] adapter for jVMC predefined models
        -   [x] metaformer base structure
        -   [x] dot-product-attention module
        -   [x] Conformer and Poolformer
        -   [x] Complex support for the metaformer
    -   [x] make different ansätze viable to be tested
        -   [x] single, real network
        -   [x] two real networks (one for complex part, one for imaginary)
        -   [x] single complex network
        -   [x] split-network architecture (last layer half of the data is used for the real part, the other half for the imaginary part)
    -   [x] benchmark the effects of the graph structure being equal/different to the problem graph structure
    -   [x] numerical solution: implement a numerical solver for the looked-at problems

-   [ ] Physics-Theory
    -   [x] Learn to formulate the mathematical theory in a concise manner to be able to use it in the thesis. Maybe refresh on quantum mechanics notation
    -   [ ] ratio of `J` to `h` (Ising-Modell-hamiltonian) in conjunction with the lattice structure dictates the 'critical point'. Search data where these have already been evaluated in the literature
    -   [ ] Get familiar with the [Rydberg atom](https://en.wikipedia.org/wiki/Rydberg_atom)-> can be used as a motivation to provide real world applications of the underlying model
    -   [ ] Explanation by Thilo Kopp about two Atoms and one Electron -> to be able to use it as a motivation for the model

# Month 3

-   [ ] Visualize the results
    -   [x] tensorboard logs
    -   [ ] nice and uniform graphs for the thesis itself
-   [ ] Extract real-world use cases for motivation
-   [ ] Write the thesis
    -   Computer Science Part:
        -   Description of the Problem
        -   Description and Motivation for the used Architecture
            -   Neural Networks
                -   concept
                -   usage
                -   pre-training ([ConvNext](https://arxiv.org/abs/2201.03545)) (short)
            -   What underlying architectures are modern/being used
                -   Depthwise <-> normal convolution
                -   Transformer
                -   Metaformer (show good performance of Poolformer even though way smaller)
                -   Graph-Networks
            -   What architectures are we employing and why
                -   What biases does the architecture have by itself
                -   What biases are we giving it on top
        -   Experiments
    -   Physics Part:
        -   Explanation of the mathematical problem
            -   Discuss the problem in general looking at the linear chain
            -   look at frustration, using a simple triangular lattice
            -   look at the phase transitions/topologies caused by the relation of `J` and `h` from the Hamiltonian
            -   motivate how the computation with neural networks can be justified
        -   `tdvp` (imaginary time evolution)
        -   Evaluation of results of the transfer to Graph-Transformer-Networks
        -   Motivation of the ansatz in connection to real world phenomenon/methods (Rydberg-Atom)
