#!/bin/bash

source ../miniconda3/bin/activate 
conda activate video_chatgpt 
export PYTHONPATH="./:$PYTHONPATH"

torchrun --nproc_per_node=8 --master_port 29001 ego_exo_video_chatgpt_unsync/train/train_mem.py \
          --model_name_or_path checkpoints/LLaVA-7B-Lightening-v1-1 \
          --version v1 \
          --data_path /data/mgovind/Video-ChatGPT/instruction_data/Adl-x-09-19.json \
          --video_folder /data/EgoExo4D/keystep_clip_features \
          --tune_mm_mlp_adapter True \
          --mm_use_vid_start_end \
          --bf16 True \
          --output_dir ./checkpoints/Ego-ADLX-unsync-26-10 \
          --num_train_epochs 3 \
          --per_device_train_batch_size 2 \
          --per_device_eval_batch_size 2 \
          --gradient_accumulation_steps 1 \
          --evaluation_strategy "no" \
          --save_strategy "steps" \
          --save_steps 3000 \
          --save_total_limit 3 \
          --learning_rate 2e-5 \
          --weight_decay 0. \
          --warmup_ratio 0.03 \
          --lr_scheduler_type "cosine" \
          --logging_steps 100 \
          --tf32 True \
          --model_max_length 2048 \
          --gradient_checkpointing True \
          --lazy_preprocess True


