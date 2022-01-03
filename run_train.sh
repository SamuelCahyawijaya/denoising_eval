# Audio Only
CUDA_VISIBLE_DEVICES=0 python train.py --output_dir=./save_ao  \
    --model_name_or_path=ctl/wav2vec2-large-xlsr-cantonese \
    --train_manifest_path=dataset/mm_train_metadata.csv \
    --valid_manifest_path=dataset/mm_validation_metadata.csv \
    --test_manifest_path=dataset/mm_test_metadata.csv \
    --num_workers=8 --preprocessing_num_workers=8 \
    --audio_column_name=audio_path --text_column_name=text_path \
    --per_device_train_batch_size=16 --per_device_eval_batch_size=16 \
    --dataloader_num_workers=32 --dataloader_pin_memory \
    --seed=14045 --num_train_epochs=20 --learning_rate=1e-5 \
    --fp16 --fp16_backend=amp \
    --logging_strategy=steps --logging_steps=10 --report_to=tensorboard \
    --evaluation_strategy=epoch --eval_steps=1 --eval_accumulation_steps=100 \
    --save_steps=1 --save_strategy=epoch --save_total_limit=3 \
    --metric_for_best_model=mer --greater_is_better=False --load_best_model_at_end=True

# Multimodal
CUDA_VISIBLE_DEVICES=0 python train.py --output_dir=./save_mm  \
    --model_name_or_path=ctl/wav2vec2-large-xlsr-cantonese \
    --train_manifest_path=dataset/mm_train_metadata.csv \
    --valid_manifest_path=dataset/mm_valid_metadata.csv \
    --test_manifest_path=dataset/mm_test_metadata.csv \
    --num_workers=8 --preprocessing_num_workers=8 --use_video \
    --audio_column_name=audio_path --text_column_name=text_path --video_column_name=lip_image_path \
    --per_device_train_batch_size=8 --per_device_eval_batch_size=8 \
    --dataloader_num_workers=32 --dataloader_pin_memory \
    --seed=14045 --num_train_epochs=20 --learning_rate=5e-5 \
    --fp16 --fp16_backend=amp \
    --logging_strategy=steps --logging_steps=10 --report_to=tensorboard \
    --evaluation_strategy=epoch --eval_steps=1 --eval_accumulation_steps=100 \
    --save_steps=1 --save_strategy=epoch --save_total_limit=3 \
    --metric_for_best_model=mer --greater_is_better=False --load_best_model_at_end=True