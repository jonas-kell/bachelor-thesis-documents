# Pre-Start events

-   [x] Meet with Daniel to talk about general theme of the thesis
-   [x] Meet with Prof. Lienhart and Daniel to get confirmation for the work together
-   [x] Meet with both Professors and all three Supervisors for official start of work
-   [x] Meet with Daniel for Computer-Science pre-briefing, management and time-scope
-   [x] Meet with Laurin and Tobias for Physics pre-briefing, management and time-scope
-   [ ] Complete full scope of expectations document (Erwartungshorizont)

# Month 1

-   [x] Get the ImageNet training data into a usable form
    -   [x] reduce from 1000 classes to 100 classes
    -   [x] get formatted to be able to train a model in a efficient manner
-   [x] implement a (vision-) transformer architecture after the [DINO](https://github.com/facebookresearch/dino) implementation (`vision_transformer.py`)

    -   [x] play with parameters, but most likely use the `vit_tiny` version
    -   [ ] look at the [PoolFormer](https://github.com/sail-sg/poolformer) implementation for implementation details
        -   e.g. implementation of MLP with 1x1-Convolution

-   [x] test training on the image data
    -   IMPORTANT: train everything the same way, do not produce optimal results, but comparable results
    -   [x] try the training on the standard image-optimized architectures (same as DINO transformer)
    -   [ ] try the training on the graph approaches
        -   classical convolution (kernel that convolutes, everything has the same weights)
        -   "symmetrical convolution" (kernel that convolutes, symmetrical with weights different for NN, NNN)
        -   "asymmetrical convolution" (kernel that convolutes, totally asymmetrical weights)
    -   [ ] try swapping architecture blocks
        -   e.g. swap Transformer Attention with convolution
        -   Replace windowed attention (=Query-Key attention) with matrix attention, that employs a adjacency matrix to reduce the influence to the really connected nodes. (Compare to the [SWIN-Transformer](https://github.com/microsoft/Swin-Transformer) implementation)
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
