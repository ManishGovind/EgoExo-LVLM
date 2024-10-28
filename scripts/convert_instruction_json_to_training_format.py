import os
import json
import argparse


def parse_args():
    parser = argparse.ArgumentParser(description="Training")

    parser.add_argument("--input_json_file", required=True,
                        help="Path to input json file (i.e. VideoInstruct_Dataset.json)")
    parser.add_argument("--output_json_file", required=True,
                        help="Path to output json file (i.e. VideoInstruct_Dataset_Train.json)")
    parser.add_argument("--clip_feature_path", required=False, default="",
                        help="Path to generated CLIP feature paths to filter any missing video ids (optional).")

    args = parser.parse_args()

    return args


def main():
    args = parse_args()
    input_json_file = args.input_json_file
    output_json_file = args.output_json_file
    clip_feature_path = args.clip_feature_path

    clip_features_files_witout_extension = ""
    if clip_feature_path:
        clip_features_files = os.listdir(clip_feature_path)
        clip_features_files_witout_extension = []
        for file in clip_features_files:
            clip_features_files_witout_extension.append(file.split('.')[0])


    input_json_contents = json.load(open(input_json_file, 'r'))
    output_json_contents = []
    
    cnt_unavailable = 0
    cnt = 0
    for i, (video_id, QAs) in enumerate(input_json_contents.items()):
        valid = False  
        video_id = video_id.replace('.mp4','')

        if not clip_feature_path:
            valid = True
        elif video_id in clip_features_files_witout_extension:
            valid = True
        elif video_id not in clip_features_files_witout_extension:
            cnt_unavailable += 1    
        

        if valid  and "exo" in video_id:
            # print(video_id)
            cnt+=1
            for content in QAs :
                if content.get('A',None) and content.get('Q',None):
                    output_content = {'id': video_id, 'video': f'{video_id}.pkl', 'conversations': []} #chnaged here for ntu
                    if i % 2 == 0:
                        output_content['conversations'].append({'from': 'human', 'value': f"{content['Q']}\n<video>"})
                    else:
                        output_content['conversations'].append({'from': 'human', 'value': f"<video>\n{content['Q']}"})
                    output_content['conversations'].append({'from': 'gpt', 'value': content['A']})
                    output_json_contents.append(output_content)
                else:
                    print(video_id)    
    
    print(f"Total : {cnt}")
    print(f"Total annotations retained: {len(output_json_contents)}")
    print(f"Total unavailable : {cnt_unavailable}")


    with open(output_json_file, 'w') as f:
        json.dump(output_json_contents, f)
    
    print(f"{cnt}")

if __name__ == "__main__":
    main()
