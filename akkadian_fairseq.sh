#!/bin/sh

OUT_DIR=$1
LR=$2
MAX_TOKENS=$3

../fairseq/fairseq_cli/train.py data-bin --arch fconv --dropout 0.1 --criterion label_smoothed_cross_entropy --label-smoothing 0.1 --optimizer nag --clip-norm 0.1 --lr ${LR} --lr-scheduler fixed --force-anneal 50 --max-tokens ${MAX_TOKENS} --no-epoch-checkpoints --patience 3 --max-epoch 1 --save-dir ${OUT_DIR}

../fairseq/fairseq_cli/generate.py data-bin --path ${OUT_DIR}/checkpoint_best.pt --beam 5
