#!/bin/bash
source /data/miniconda3/bin/activate
conda activate vchatgpt

# Define common arguments for all scripts
PRED_DIR=/data/mgovind/LLAVIDAL/fixed-object-video-10-16
OUTPUT_DIR=charades_eval_1
API_KEY=''
OUTPUT_NAME=object-videoRerun

rm -rf  charades_eval_1
# Run the "correctness" evaluation script
python evaluate_benchmark_1_correctness.py \
      --pred_path ${PRED_DIR}/Action-Desc-Charades.json \
      --api_key  $API_KEY \
      --output_dir $OUTPUT_DIR \
      --output_json ${OUTPUT_NAME}-corr.json \
      --num_tasks 4

rm -rf  charades_eval_1

# # Run the "detailed orientation" evaluation script
python evaluate_benchmark_2_detailed_orientation.py \
  --pred_path $PRED_DIR/Action-Desc-Charades.json \
  --api_key $API_KEY \
  --output_dir $OUTPUT_DIR \
  --output_json ${OUTPUT_NAME}-do.json \
  --num_tasks 4

rm -rf  charades_eval_1


python evaluate_benchmark_3_context.py \
  --pred_path $PRED_DIR/Action-Desc-Charades.json \
  --api_key $API_KEY \
  --output_dir $OUTPUT_DIR \
  --output_json ${OUTPUT_NAME}-con.json \
  --num_tasks 4

rm -rf  charades_eval_1
python evaluate_benchmark_4_temporal.py \
  --pred_path $PRED_DIR/Action-Desc-Charades.json \
  --api_key $API_KEY \
  --output_dir $OUTPUT_DIR \
  --output_json ${OUTPUT_NAME}-temp.json \
  --num_tasks 4


rm -rf  charades_eval_1

python evaluate_benchmark_5_consistency.py \
  --pred_path $PRED_DIR/Action-Desc-Charades-consistency.json \
  --api_key $API_KEY \
  --output_dir $OUTPUT_DIR \
  --output_json ${OUTPUT_NAME}_des_cons.json \
  --num_tasks 4

rm -rf  charades_eval_1

echo "All evaluations completed!"
