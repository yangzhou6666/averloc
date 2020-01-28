###########################################################
# Change the following values to train a new model.
# type: the name of the new model, only affects the saved file name.
# dataset: the name of the dataset, as was preprocessed using preprocess.sh
# test_data: by default, points to the validation set, since this is the set that
#   will be evaluated after each training iteration. If you wish to test
#   on the final (held-out) test set, change 'val' to 'test'.
type=adv_training_precise
dataset_name=data
data_dir=data/transformed_data
train_dir=data/transformed_data/adv_data
num_funcs=189417
num_transformations=9
data=${data_dir}/${dataset_name}
test_data=${data_dir}/${dataset_name}.val.c2s
model_dir=models/${type}

mkdir -p ${model_dir}
set -e
python3 -u code2seq.py --data ${data} --test ${test_data} -f ${num_funcs} -t ${num_transformations} -td ${train_dir} --save_prefix ${model_dir}/model
