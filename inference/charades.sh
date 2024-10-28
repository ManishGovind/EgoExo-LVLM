#!/bin/bash


python multiproc_run_inference_action_recognition_charades.py --video_dir /data/CHARADES/Charades_v1_480/ --qa_file /data/mgovind/ADLX_evaluation/ADLMCQ-AR-Charades.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/Ego+Exo --output_name AR-Charades \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/EgoExo_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  --num_processes 8


python multiproc_run_inference_action_recognition_charades.py --video_dir /data/CHARADES/Charades_v1_480/ --qa_file /data/mgovind/ADLX_evaluation/ADLMCQ-AR-Charades.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/BestExo --output_name AR-Charades \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/BestExo_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  --num_processes 8


python multiproc_run_inference_action_recognition_charades.py --video_dir /data/CHARADES/Charades_v1_480/ --qa_file /data/mgovind/ADLX_evaluation/ADLMCQ-AR-Charades.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/BestExo-cropped --output_name AR-Charades \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/Best_Exo_Cropped_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  --num_processes 8


python multiproc_run_inference_action_recognition_charades.py --video_dir /data/CHARADES/Charades_v1_480/ --qa_file /data/mgovind/ADLX_evaluation/ADLMCQ-AR-Charades.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/Exo-cropped --output_name AR-Charades \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/Exo_Cropped_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  --num_processes 8


python multiproc_run_inference_action_recognition_charades.py --video_dir /data/CHARADES/Charades_v1_480/ --qa_file /data/mgovind/ADLX_evaluation/ADLMCQ-AR-Charades.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/Ego+BestExo --output_name AR-Charades \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/Ego_Best_Exo_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  --num_processes 8


python multiproc_run_inference_action_recognition_charades.py --video_dir /data/CHARADES/Charades_v1_480/ --qa_file /data/mgovind/ADLX_evaluation/ADLMCQ-AR-Charades.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/Ego+ADLX --output_name AR-Charades \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/Ego_ADLX_Checkpoints/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  --num_processes 8


python multiproc_run_inference_action_recognition_charades.py --video_dir /data/CHARADES/Charades_v1_480/ --qa_file /data/mgovind/ADLX_evaluation/ADLMCQ-AR-Charades.json \
 --output_dir /data/mgovind/Video-ChatGPT/EgoExo-New-Eval/Exo+ADLX --output_name AR-Charades \
 --model-name /data/mgovind/Video-ChatGPT/checkpoints/LLaVA-7B-Lightening-v1-1  \
 --projection_path /data/mgovind/Video-ChatGPT/checkpoints/Exo_AdlX_Checkpoints-continue/mm_projector.bin \
 --videochatgpt_path /data/mgovind/Video-ChatGPT/  --num_processes 8