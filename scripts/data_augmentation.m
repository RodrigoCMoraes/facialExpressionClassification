clear all;
clc;

% 10 degrees range give 20 different possible angles with precision 1 degree
t1 = 20 + 1;

% 0.1 is equal 10% of image width to be shifted left or right
t2 = floor(0.2 * 48) + 1;

% 0.1 is equal 10% of image height to be shifted up or down
t3 = floor(0.2 * 48) + 1;

% 0.1 is equal 10% of image width to be scaled in or out
t4 = floor(0.2 * 48) + 1;

% can be flipped left or right
t5 = 2;

% all operations can be done indenpently
t = [t1 t2 t3 t4 t5];

total_transformations = 0;
for k = 1:5
  % generate a matrix with all possible combinations with 'k' transformations
  combinations_with_k = nchoosek(t, k);
  
  % get number of combinations with k transformations
  module_combinations_with_k = size(combinations_with_k)(1);
  permutations_of_k = factorial(module_combinations_with_k);
  for i = 1:module_combinations_with_k
    combination_i = combinations_with_k(i, :);
    total_transformations += (prod(combination_i) * permutations_of_k);
  endfor
  
endfor

% total_transformations = 732806888

dataset_samples = 35887;

dataset_with_augmentation = dataset_samples * total_transformations;
increase_factor = dataset_with_augmentation / dataset_samples;

% dataset_with_augmentation = 1.3274e+15
% increase_factor = 3.6989e+10