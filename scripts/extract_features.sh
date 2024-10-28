source /data/miniconda3/bin/activate 
conda activate vchatgpt


id=$1
CUDA_VISIBLE_DEVICES=$id python  save_spatio_temporal_clip_features.py --process_num $id --video_dir_path /data/EgoExo4D/keystep_segments/cropped_exo_segments --clip_feat_path /data/EgoExo4D/clip_features 