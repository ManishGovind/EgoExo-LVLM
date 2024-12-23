import os
import argparse
import json
from tqdm import tqdm
from video_chatgpt.eval.model_utils import initialize_model, load_video
from video_chatgpt.inference import video_chatgpt_infer


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--qa_file', help='Path to the QA file containing video ids, questions, and answers.', required=False, default='/path/to/qa_file.json')
    parser.add_argument('--output_dir', help='Directory to save the model results JSON.', required=False, default='/path/to/output_dir')
    parser.add_argument('--output_name', help='Name of the file for storing results JSON.', required=False, default='output_file_name')
    parser.add_argument("--model-name", type=str, required=False, default='/path/to/model')
    parser.add_argument("--conv-mode", type=str, required=False, default='video-chatgpt_v1')
    parser.add_argument("--projection_path", type=str, required=False, default='/path/to/projection.bin')
    return parser.parse_args()

def save_to_json(output_dir, output_name, data):
    output_path = os.path.join(output_dir, output_name)
    with open(output_path, 'w') as file:
        json.dump(data, file, indent=4)

def run_inference(args):
    model, vision_tower, tokenizer, image_processor, video_token_len = initialize_model(args.model_name, args.projection_path)
    with open(args.qa_file) as file:
        qa_data = json.load(file)
    if not os.path.exists(args.output_dir):
        os.makedirs(args.output_dir)
    output_list = []
    conv_mode = args.conv_mode
    correct_count = 0
    total_count = 0
    for i , sample in tqdm(qa_data.items()):
        video_id = sample['video_id']
        video_path = f'{video_id}/master/rgb.mp4'
        video_path = os.path.join('/data/LEMMA/data', video_path)
        # print(video_path)
        question = sample['question'] + '. The output should be the choice among one of the following choices.'
        choices = sample['choices']
        ground_truth = choices[sample['answer']]
        # Format choices as a string
        if isinstance(choices, dict):
            choices_str = ' '.join([f"{key}: {value}" for key, value in choices.items()])
        elif isinstance(choices, list):
            choices_str = ' '.join(choices)
        else:
            raise ValueError(f"Unexpected format for choices: {choices}")

        formatted_question = f"{question} Choices are {choices_str}"
        if os.path.exists(video_path):
            video_frames = load_video(video_path)
        if video_frames is None:
            print(f"Skipping video: {video_id}")
            continue
        try:
            prediction = video_chatgpt_infer(video_frames, formatted_question, conv_mode, model, vision_tower, tokenizer, image_processor, video_token_len)
            sample['prediction'] = prediction
            output_list.append({'video_id': video_id, 'ground_truth': ground_truth, 'prediction': prediction})
        except Exception as e:
            print(f"Error processing video file '{video_id}': {e}")
    save_to_json(args.output_dir,f"{args.output_name}.json",output_list )

if __name__ == "__main__":
    args = parse_args()
    run_inference(args)