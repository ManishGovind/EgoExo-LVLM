#!/bin/bash


CUDA_VISIBLE_DEVICES=1 python run_inference_action_forecasting_tsu.py --video_dir /data/smarthome/smarthome_untrimmed/smarthome_action_forecasting_clips/ \
 --qa_file /data/mgovind/ADLX_evaluation/smarthome_forecasting_data.json --output_dir /data/mgovind/EgoExo-New-Eval/BestExo \
 --output_name AF-TSU --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1 \
 --projection_path /data/mgovind/BestExo_Checkpoints/mm_projector.bin  --videochatgpt_path /data/mgovind/Video-ChatGPT/


CUDA_VISIBLE_DEVICES=1 python run_inference_action_forecasting_tsu.py --video_dir /data/smarthome/smarthome_untrimmed/smarthome_action_forecasting_clips/ \
 --qa_file /data/mgovind/ADLX_evaluation/smarthome_forecasting_data.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/Exo-only --output_name AF-TSU \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/Exo-1.2_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  

CUDA_VISIBLE_DEVICES=1 python run_inference_action_forecasting_tsu.py --video_dir /data/smarthome/smarthome_untrimmed/smarthome_action_forecasting_clips/ --qa_file /data/mgovind/ADLX_evaluation/smarthome_forecasting_data.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/Ego-only --output_name AF-TSU \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/Ego-1.1_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  


CUDA_VISIBLE_DEVICES=1 python run_inference_action_forecasting_tsu.py --video_dir /data/smarthome/smarthome_untrimmed/smarthome_action_forecasting_clips/ --qa_file /data/mgovind/ADLX_evaluation/smarthome_forecasting_data.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/BestExo-cropped --output_name AF-TSU \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/Best_Exo_Cropped_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  


CUDA_VISIBLE_DEVICES=1 python run_inference_action_forecasting_tsu.py --video_dir /data/smarthome/smarthome_untrimmed/smarthome_action_forecasting_clips/ --qa_file /data/mgovind/ADLX_evaluation/smarthome_forecasting_data.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/Exo-cropped --output_name AF-TSU \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/Exo_Cropped_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  


CUDA_VISIBLE_DEVICES=1 python run_inference_action_forecasting_tsu.py --video_dir /data/smarthome/smarthome_untrimmed/smarthome_action_forecasting_clips/ --qa_file /data/mgovind/ADLX_evaluation/smarthome_forecasting_data.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/Ego+Exo --output_name AF-TSU \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/EgoExo_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  

CUDA_VISIBLE_DEVICES=1 python run_inference_action_forecasting_tsu.py --video_dir /data/smarthome/smarthome_untrimmed/smarthome_action_forecasting_clips/ --qa_file /data/mgovind/ADLX_evaluation/smarthome_forecasting_data.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/Ego+BestExo --output_name AF-TSU \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/Ego_Best_Exo_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  


CUDA_VISIBLE_DEVICES=1 python run_inference_action_forecasting_tsu.py --video_dir /data/smarthome/smarthome_untrimmed/smarthome_action_forecasting_clips/ --qa_file /data/mgovind/ADLX_evaluation/smarthome_forecasting_data.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/Ego+ADLX --output_name AF-TSU \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/Ego_ADLX_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  


CUDA_VISIBLE_DEVICES=1 python run_inference_action_forecasting_tsu.py --video_dir /data/smarthome/smarthome_untrimmed/smarthome_action_forecasting_clips/ --qa_file /data/mgovind/ADLX_evaluation/smarthome_forecasting_data.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/Exo+ADLX --output_name AF-TSU \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/Exo_AdlX_Checkpoints-continue/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  