CUDA_VISIBLE_DEVICES=0 python eval.py --model_name_or_path=save_ao/checkpoint-4500 \
    --train_manifest_path=dataset/mm_train_metadata.csv \
    --valid_manifest_path=dataset/mm_validation_metadata.csv \
    --test_manifest_path=dataset/mm_test_metadata.csv \
    --num_workers=8 --preprocessing_num_workers=16 \
    --audio_column_name=audio_path --text_column_name=text_path \
    --fp16 --fp16_backend=amp \
    --per_device_train_batch_size=16 --per_device_eval_batch_size=16 \
    --dataloader_num_workers=16 --dataloader_pin_memory --group_by_length \
    --seed=14045 --num_train_epochs=5 --learning_rate=1e-5 --output_dir=./eval_result_ao
    
# Multimodal
CUDA_VISIBLE_DEVICES=0 python eval.py --model_name_or_path=save_mm/checkpoint-8980 \
    --train_manifest_path=dataset/mm_train_metadata.csv \
    --valid_manifest_path=dataset/mm_validation_metadata.csv \
    --test_manifest_path=dataset/mm_test_metadata.csv \
    --num_workers=8 --preprocessing_num_workers=16 --use_video \
    --audio_column_name=audio_path --text_column_name=text_path --video_column_name=lip_image_path \
    --fp16 --fp16_backend=amp \
    --per_device_train_batch_size=16 --per_device_eval_batch_size=16 \
    --dataloader_num_workers=16 --dataloader_pin_memory --group_by_length \
    --seed=14045 --num_train_epochs=5 --learning_rate=5e-5 --output_dir=./eval_result_mm