#!/bin/bash

source /data/miniconda3/bin/activate 
# conda init
conda activate video_chatgpt 
export PYTHONPATH="./:$PYTHONPATH"



model=/data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1
projection=/data/mgovind/Video-ChatGPT/ego-repro.bin
output_dir=./EgoExo-Eval/ego-hpcruns
output_name=Ego-Best-Exo-cropped-Diff-Proj


# CUDA_VISIBLE_DEVICES=3 python video_chatgpt/eval/run_inference_action_recognition_charades.py   --model-name $model \
#      --projection_path $projection \
#      --output_dir $output_dir  --output_name AR-Charades \
#      --qa_file /data/mgovind/ADLX_evaluation/ADLMCQ-AR-Charades.json \
#      --video_dir  /data/CHARADES/Charades_v1_480/
# /data/mgovind/ADLX_evaluation/ADLMCQ-AR-Smarthome.json \

CUDA_VISIBLE_DEVICES=2 python video_chatgpt/eval/run_inference_action_recognition_smarthome.py   --model-name $model \
     --projection_path $projection \
     --output_dir $output_dir  --output_name AR-smarthome-20-run-1 \
     --qa_file  /data/mgovind/Video-ChatGPT/AR-subset.json       --video_dir  /data/smarthome/cropped224x224_better/mp4/
 

# CUDA_VISIBLE_DEVICES=3 python video_chatgpt/eval/run_inference_action_forecasting.py --model-name $model \
#      --projection_path $projection \
#      --output_dir $output_dir  --output_name AF-Lemma \
#      --qa_file /data/mgovind/ADLX_evaluation/evaluation_ADLMCQ_AF_LEMMA.json 

# CUDA_VISIBLE_DEVICES=3 python video_chatgpt/eval/run_inference_descriptions_charades.py  \
#   --model-name $model   --projection_path $projection \
#    --output_dir $output_dir --output_name Action-Desc-Charades  --gt_file /data/CHARADES/test_set_captions.json    --video_dir /data/CHARADES/Charades_v1_480/

# CUDA_VISIBLE_DEVICES=3 python video_chatgpt/eval/run_inference_benchmark_consistency.py  \
#   --model-name $model   --projection_path $projection  --output_dir $output_dir --output_name Action-Desc-Charades-consistency \
#   --gt_file /data/mgovind/ADLX_evaluation/charades_consistency_qa.json    --video_dir /data/CHARADES/Charades_v1_480/

