# ITF Denoising & Enhancement

## Folder Structure
- args_helper.py
- data_utils.py
- eval.py
- preprocess_data.py
- save_ao/
  - 14045 (from the audio-only model zip file mentioned below)
- save_mm/
  - 14045 (from the multimodel model zip file mentioned below)
- save_mm/s
- datasets/
  - mm_all_metadata.csv
  - generate_denoising_metadata.ipynb
  - audios (from the CI-AVSR dataset)
  - transcription (from the CI-AVSR dataset)
  - lip_images (from the CI-AVSR dataset)
  - images (from the CI-AVSR dataset)
 
## Setup
1. Download and extract the [CI-AVSR dataset](https://storage.googleapis.com/samcah-bucket/mm-asr/CI-AVSR.tar.gz) inside the `datasets/` folder
2. Setup the environment, install packages from `requirements_sam.txt`
3. Download the model: [Audio-only](https://storage.googleapis.com/samcah-bucket/ao_model.zip) and [Multimodal](https://storage.googleapis.com/samcah-bucket/mm_model.zip)

## Running the Evaluation
1. Put the denoised folder under `datasets/audios/` folder, e.g. for the latest denoising v4 evaluation, I copy the folder into `datasets/audios/test_denoising_v4` which contains per noise folder and `filename.txt`
2. Modify the `generate_denoising_metadata.ipynb` to point to the new audio folder (don't forget to specify the output folder as well), and run the notebook. This will generate the metadata, the preprocess bash scripts, and the evaluation bash scripts.
3. Run the generated preprocess file from the root directory of the project, e.g. `bash run_preprocess_test_denoising_v4.sh`. This script will generate a cached dataset folder specified in the `--output_dir`
4. Run the eval script that corresponds to the preprocess file, e.g., `bash run_eval_test_denoising_v4.sh`. This script will store the evaluation result on the folder specified in the `--output_dir`
5. Open `eval_denoising.ipynb`, update the path to the correct save folder, and run the notebook to get the eval result
