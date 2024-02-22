#!/bin/bash

# 函数用于清理输入变量中的\r字符
clean_crlf() {
    echo "$1" | sed 's/\r//g'
}

# 环境变量和参数初始化
export OPENAI_LOGDIR=$(clean_crlf "output_mdtv2_s2")
NUM_GPUS=8
IMAGE_SIZE=1024
MASK_RATIO=$(clean_crlf "0.30")
DECODE_LAYER=$(clean_crlf "4")
MODEL=$(clean_crlf "MDTv2_S_2")
DIFFUSION_STEPS=1000
BATCH_SIZE=16
DATA_PATH=$(clean_crlf "/public/hezhenliang/users/gaoge/Data/ConvertedFFHQ")
#CHECKPOINT_PATH="/public/hezhenliang/users/gaoge/VIPLFaceMDT/VIPLMDT/checkpoint/FFHQ.pt"
# 构建命令参数
MODEL_FLAGS="--image_size $IMAGE_SIZE --mask_ratio $MASK_RATIO --decode_layer $DECODE_LAYER --model $MODEL"
DIFFUSION_FLAGS="--diffusion_steps $DIFFUSION_STEPS"
TRAIN_FLAGS="--batch_size $BATCH_SIZE"
#CHECKPOINT_FLAG="--resume_checkpoint $CHECKPOINT_PATH"
# 执行Python命令

cd /public/hezhenliang/users/gaoge/VIPLFaceMDT/VIPL_MDT
python -m torch.distributed.launch --nproc_per_node=$NUM_GPUS image_train.py --data_dir="$DATA_PATH" $MODEL_FLAGS $DIFFUSION_FLAGS $TRAIN_FLAGS