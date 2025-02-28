function [histBinsMat, varBins] = histBins(X, numberOfBins)
% Each row of X is the results of a single occurrence of the random
% variable X. The number of rows is the number of experiments done.

% Number of bins is a vector which holds the number of bins for each
% dimension of the histogram. 

[numberOfRandomVars, numberOfExperiments] = size(X); 


for(i = 1:numberOfRandomVars)
    varMin(i) = min(X(i, :));
    varMax(i) = max(X(i, :));

    if(varMin(i) == varMax(i))
        varBins{i} = varMax;
        binLength(1,i) = 1;
    else
        varBinDelta(i) = (varMax(i)-varMin(i))/numberOfBins(i);
        varBins{i} = [varMin(i):varBinDelta(i):varMax(i)];
        binLength(1,i) = length(varBins{i})-1;
    end
end

histBinsMat = zeros(binLength)

for(i = 1:numberOfExperiments)
    for(j = 1:numberOfRandomVars)
        if(binLength(1,j) == 1)
            binCoordinate(j) = 1;
        else
            for(k =1:binLength(j))
                if(X(j,i)>=varBins{j}(k) && X(j,i)<=varBins{j}(k+1))
                    binCoordinate(j) = k;
                    break;
                end
            end
        end
    end

    linearIdx = num2cell(binCoordinate);
    histBinsMat(linearIdx{:}) =  histBinsMat(linearIdx{:}) + 1;
    binCoordinate = [];
end





end

