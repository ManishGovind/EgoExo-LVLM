# Need to call this before importing transformers.
# from video_chatgpt.train.llama_flash_attn_monkey_patch import replace_llama_attn_with_flash_attn

# replace_llama_attn_with_flash_attn()

from ego_exo_video_chatgpt_unsync.train.train import train


if __name__ == "__main__":
    train()
