function PlotSignalAndFrequencyWelch(signalDomain ,signalRange, samplingFrequency, numberOfWindows,signalPlotTitle, frequencyPlotTitle)

if(nargin == 4)
    signalPlotTitle = 'Default signal plot title';
    frequencyPlotTitle = 'Default frequency plot title';
end

if(nargin == 5)
    frequencyPlotTitle = 'Default frequency plot title';
end

signalLength = length(signalDomain); % Length of signal

windowLength = signalLength/numberOfWindows

for(i = 1:numberOfWindows)
    windowIndexes = [windowLength*(i-1)+1:windowLength*i]
    windowFourierTransform(:,i) = fft(signalRange(windowIndexes));
    windowAmplitudes(:,i) = 2/windowLength * abs(windowFourierTransform(1:windowLength/2, i))
end

if(numberOfWindows == 1)
    frequencyAmplitudes = windowAmplitudes;
else 
    frequencyAmplitudes = mean(windowAmplitudes');
end



% % Compute the FFT
% signalFourierTransform = fft(signalRange);
% 
% % Compute the corresponding frequencies
frequencies = samplingFrequency*(0:(windowLength/2)-1)/windowLength;

subplot(2, 1, 1);
plot(signalDomain, signalRange)
title(signalPlotTitle);
xlabel('Time (s)');
ylabel('Displacement (m)');
grid on; 
hold on;

subplot(2, 1, 2);
loglog(frequencies, frequencyAmplitudes);
title(frequencyPlotTitle);
xlabel('Frequency (Hz)');
ylabel('Amplitude (m)');
grid on;



end

