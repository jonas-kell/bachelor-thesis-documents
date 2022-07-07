# "Style-Guide" / Reference to the notation of ML-Networks

## Possible Notation Types

-   Natural Language Notation
-   Matrix-Multiplication Notation
-   Box-Notation
-   Convolution Notation

### <u>Natural Language Notation</u>

Input, Graph (Pooling + Multi-Layer-Perceptron), ..., Output

### <u>Matrix-Multiplication Notation</u>

**TODO:** write down matrix representation of a Graph, a MLP-Layer and a Norm-Layer

(Graph $\stackrel{\wedge}{=}$ adjacency matrix. Is Pooling, then MLP, with weights strategically set to 1 (more specifically to _connection-weight_) or $-\infty$ (to get 0 out of softmax-layers)

**TODO:** think how to use more than degree of neighborhood together. Isolated networks for each degree or possible to add up matrices with differently weighted connections and do in one go.

### <u>Box-Notation</u>

$v^{l} \rightarrow \fbox{dConv} \rightarrow \fbox{1x1 Conv (= channelwise MLP)} \rightarrow v^{(l+1)}$

### <u>Convolution Notation</u>

Example: [MoblieNet Architecture](https://arxiv.org/abs/1704.04861)

-   $B$: Batch
-   $C_1$: Channels (of a Picture)
-   $H$: Height (of a Picture)
-   $W$: Width (of a Picture)
-   $C_2$: Number of Convolution-Filters
-   $h$: height of a Convolution-Filter
-   $w$: width of a Convolution-Filter

Step 1: Extract Feature Maps

$$(B, C_1, H, W) (1, 1, h, w) \rightarrow (B, C_1, H, W)$$

Step 2: Convolute Feature Maps

$$(B, C_1, H, W) (C_1, C_2, 1, 1) \rightarrow (B, C_2, H, W)$$

-   Doing _Step 1_ and _Step 2_ separately should increase performance.
-   1x1-Convolution $\stackrel{\wedge}{=}$ linear Layer

### <u>Types of convolutions</u>

-   normal convolution
    $$(B, C_I, H, W)(C_I, C_T, K_1, K_2)\rightarrow (B, C_T, H, W)$$
-   depthwise separable convolution (motivated by [MobileNet](https://arxiv.org/abs/1704.04861)):
    $$(B, C_I, H, W)(1, 1, K_1, K_2)\rightarrow (B, C_I, H, W)$$
    $$(B, C_I, H, W)(C_I, C_T, 1, 1)\rightarrow (B, C_T, H, W)$$
