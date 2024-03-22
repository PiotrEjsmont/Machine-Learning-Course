function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C_test = 0.01;
sigma_test = 0.01;
error = 100;
C = 1;
sigma = 0.1;
iteration = 0;
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

for i=0:7
    for j=0:7
        model= svmTrain(X, y, C_test*(3^i), @(x1, x2) gaussianKernel(x1, x2, sigma_test*(3^j)));
        iteration += 1;
        printf("Iteration %d completed\n", iteration);
        predictions = svmPredict(model, Xval);
        if mean(double(predictions ~= yval)) < error;
            error = mean(double(predictions ~= yval));
            C = C_test*(3^i);
            sigma = sigma_test*(3^j);
        end
    end
end
C
sigma

% =========================================================================

end
