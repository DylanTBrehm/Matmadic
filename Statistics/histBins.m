function [histBinsMat, histBinsDataIndices,binBoundaries, binCenters] = histBins(X, numberOfBins)
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
        varBinDelta(i) = (varMax(i)-varMin(i))/(numberOfBins(i));
        varBins{i} = linspace(varMin(i), varMax(i), numberOfBins(i)+1);
        binLength(1,i) = length(varBins{i})-1;
    end
end

if(numberOfRandomVars == 1)
    histBinsMat = zeros(binLength,1);
else
    histBinsMat = zeros(binLength);
end

histBinsDataIndices = cell(binLength);


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
    histBinsDataIndices{linearIdx{:}} = [histBinsDataIndices{linearIdx{:}};i];
    histBinsMat(linearIdx{:}) =  histBinsMat(linearIdx{:}) + 1;
    binCoordinate = [];
end


% for(i = 1:length(numberOfBins))
%     for(j = 1:numberOfBins(i))
%         
%     end
% end

binBoundaries = varBins;





end

