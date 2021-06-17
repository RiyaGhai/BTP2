% MULTI-THRESHOLDING IMAGE SEGMENTATION USING GENETIC ALGORITHMS


% Default variables
n_population =  20;
n_iterations =  70;
n_bins       = 256;
n_thresholds =   10;

% Ratios of all GA operations
p_selection = 0.1;
p_crossover = 0.7;
p_mutation  = 0.2;
assert(sum([p_selection, p_crossover, p_mutation]) == 1, 'Total sum of proportions have to be 1!');

% Read image
image = imread("leaf.jpg");
s=length(size(image));
if( s == 3)
image = rgb2gray(image);
end

% Convert image to gray levels
if (size(image, 3) == 3)
    image_gray = rgb2gray(image);
else
    image_gray = image;
end

% Initialization
population = initialization(n_population, n_bins, n_thresholds);

for i = 1:n_iterations
    new_population = [];

    % Evaluation of fitness
    ranking = fitness(image, population, n_thresholds);

    %% Reproduction
    % Selection
    % TODO create more strategies (like roulette wheel)
    new_population = first_best(ranking, population, p_selection, new_population);

    % Crossover
    new_population = crossover(population, p_crossover, new_population);

    % Mutation
    new_population = mutation(population, p_mutation, new_population);

    population = new_population;
    
end
% First input argument must be single or double
% Accepting the solution
accept_solution(image_gray, population, n_thresholds,image);

