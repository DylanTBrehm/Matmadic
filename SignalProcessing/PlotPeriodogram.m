function PlotPeriodogram(signalDomain ,signalRange, samplingFrequency, signalPlotTitle, frequencyPlotTitle)
%PLOTPERIODOGRAM Summary of this function goes here
%   Detailed explanation goes here
if(nargin == 3)
    signalPlotTitle = 'Default signal plot title';
    frequencyPlotTitle = 'Default frequency plot title';
end

if(nargin == 4)
    frequencyPlotTitle = 'Default frequency plot title';
end

signalLength = length(signalDomain); % Length of signal

% Compute the FFT
signalFourierTransform = fft(signalRange);

% Compute the corresponding frequencies
frequencies = samplingFrequency*(0:(signalLength/2))/signalLength;

subplot(2, 1, 1);
plot(signalDomain, signalRange)
title(signalPlotTitle);
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

periodogramVals = (abs(signalFourierTransform(1:signalLength/2+1)).^2)/(signalDomain(end)-signalDomain(1));
mean(periodogramVals)
subplot(2, 1, 2);
plot(frequencies, periodogramVals  );
title('Default frequency plot title');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;
end

