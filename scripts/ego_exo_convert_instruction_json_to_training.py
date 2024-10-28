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
            # file = file.replace('cropped_','')
            clip_features_files_witout_extension.append(file.split('.')[0])

    print(clip_features_files_witout_extension[0])
    clip_features_path = os.listdir('/data/EgoExo4D/keystep_clip_features')
    input_json_contents = json.load(open(input_json_file, 'r'))
    output_json_contents = []
    
    # with open('/data/mgovind/EgoExo_QA_pairs/bestexo_keysteps.json', 'r') as json_file:
    #     data = json.load(json_file)

    # best_exo_keysteps = []
    # for split , ids in data.items():
    #     best_exo_keysteps.extend(ids)
    cnt = 0
    for i, (video_id, QAs) in enumerate(input_json_contents.items()):
        valid = False
        # if video_id not in best_exo_keysteps :
        #     continue   
        video_id = video_id.replace('.mp4','')
        # print(video_id)
        if not clip_feature_path:
            valid = True
        elif video_id in clip_features_files_witout_extension:
            valid = True

        if valid  and "exo" in video_id:
            # print(video_id)
            cnt+=1
            for content in QAs :
                if content.get('A',None) and content.get('Q',None):
                    ego_video_list = video_id.split('_')
                    ego_video_list[-1] = 'ego'
                    ego_video_name = '_'.join(ego_video_list)
                    
                    if f'{ego_video_name}.pkl' not in clip_features_path :
                        print("No ", ego_video_name)
                
                    output_content = {'id': video_id, 'video': f'{video_id}.pkl','ego_video':f'{ego_video_name}.pkl' ,  'conversations': []} #chnaged here for ntu
                    if i % 2 == 0:
                        output_content['conversations'].append({'from': 'human', 'value': f"{content['Q']}\n<exo_video><ego_video>"})
                    else:
                        output_content['conversations'].append({'from': 'human', 'value': f"<exo_video><ego_video>\n{content['Q']}"})
                    output_content['conversations'].append({'from': 'gpt', 'value': content['A']})
                    output_json_contents.append(output_content)
                else:
                    print(video_id)    
    
    # print(f"Total keysegments: {cnt}")
    # print(f"Total annotations retained: {len(output_json_contents)}")


    with open(output_json_file, 'w') as f:
        json.dump(output_json_contents, f)
    
    # print(f"best exo", cnt , len(best_exo_keysteps))

if __name__ == "__main__":
    main()
