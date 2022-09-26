#!/bin/bash

# you have to execute this in the bachelor-thesis-experiments folder for pythonm to find the relative imports

for VARIABLE in TF TF-ALT TF-NO GTF-NN GTF-NN-ALT GTF-NN-NO GTF-NNN GTF-NNN-ALT GTF-NNN-NO PF GPF-NN GPF-NNN DCF SDCF-NN SDCF-NNN SGDCF-NN SGDCF-NNN CF
do
    python3 main.py train model_name=$VARIABLE max_epochs=1 > /home/jonas/Github/bachelor-thesis/bachelor-thesis-documents/thesis-latex/experiments/image-classification/comparison-token-mixers/timing/$VARIABLE.txt
done

python3 slack/message.py
