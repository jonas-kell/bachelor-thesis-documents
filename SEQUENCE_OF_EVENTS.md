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

    -   [x] play with parameters, but most likely use the `vit_tiny` version

-   [ ] Modify the structure of the Metaformer

    -   [ ] Ability to toggle downstream Graph element (after token mixer, before layernorm)
        -   look at the [Swin-Transformer](https://github.com/microsoft/Swin-Transformer) implementation for implementation details concerning the adjacency matrix
        -   [x] implement Graph element creation
        -   [ ] use Graph element
    -   [ ] customize, to be able to replace parts of the architecture

        -   [ ] Default Attention based Metaformer (Transformer)
        -   [ ] Metaformer with Pooling as a Token Mixer (Poolformer)
            -   look at the [PoolFormer](https://github.com/sail-sg/poolformer) implementation for implementation details and Metaformer Motivation
        -   [ ] Metaformer with Convolutions as Token mixers
            -   [ ] Separate by weight distribution
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

    -   [ ] Full list of Metaformer-Architectures
        -   Attention Based
            -   default (Vision-) Transformer **(VT)**
            -   Graph (Vision-) Transformer NN **(GVT-NN)**
            -   Graph (Vision-) Transformer NNN **(GVT-NNN)**
        -   Not Attention Based
            -   Poolformer **(PF)**
            -   Graph Poolformer NN **(GP-NN)**
            -   Graph Poolformer NNN **(GP-NN)**
            -   Convolution Architectures (Graph and non-graph variants should have identical outputs, but Graph is more versatile in practice and convolution more efficient)
                -   Classical d(epthwise)Conformer **(CD)**
                -   Symmetric d(epthwise)Conformer NN **(SD-NN)**
                -   Symmetric d(epthwise)Conformer NNN **(SD-NNN)**
                -   Symmetric Graph-d(epthwise)Conformer NN **(GSD-NN)**
                -   Symmetric Graph-d(epthwise)Conformer NNN **(GSD-NNN)**
        -   Not comparable architecture (Has non-transformer-architecture computing capabilities)
            -   Conformer **(CF)**
            -   Symmetric Conformer NN **(GF-NN)**
            -   Symmetric Conformer NNN **(GF-NNN)**

-   [x] test training on the image data
    -   IMPORTANT: train everything the same way, do not produce optimal results, but comparable results
    -   [x] try the training on the standard image-optimized architectures (same as DINO transformer)
    -   [ ] real training pass on the modified architectures
-   [ ] if there is time remaining, try testing on the graph dataset [NCI1](https://paperswithcode.com/dataset/nci1)

# Month 2

-   [ ] carry the learned information over to JAX.
    -   Either:
        -   Directly in JAX
        -   By using the [Jraph](https://github.com/deepmind/jraph) library
-   [ ] Train/Compute on JAX-Jsing Model data
    -   Everything should be implemented already, drop in possibility for own network
    -   [ ] benchmark the effects of the graph structure being equal/different to the problem graph structure
-   [ ] Physics-Theory
    -   [ ] Learn to formulate the mathematical theory in a concise manner to be able to use it in the thesis. Maybe refresh on quantum mechanics notation
    -   [ ] Get familiar with the [Rydberg atom](https://en.wikipedia.org/wiki/Rydberg_atom)-> can be used as a motivation to provide real world applications of the underlying model
    -   [ ] Explanation by Thilo Kopp about two Atoms and one Electron -> to be able to use it as a motivation for the model

# Month 3

-   [ ] Visualize the results
-   [ ] ## Extrapolate to real-world use cases for motivation
-   [ ] Write the thesis
    -   Computer Science Part:
        -   Description of the Problem
        -   Description and Motivation for the used Architecture
        -   Experiments
    -   Physics Part (Probably):
        -   Explanation of the mathematical problem
        -   Motivation of the ansatz in connection to real world phenomenon/methods
        -   Evaluation of results of the transfer to Graph-Transformer-Networks
