clear
clc
load('DBS-OFF-DATA.mat')

%% Task 1:
% functions use: plot subplot
fs = 500;
figure(1)
subplot(2,1,1)
plot((1:length(Data(1,2000:end)))/fs,Data(1,2000:end));
xlabel('time(s)')
ylabel('amplitude(uv)')
title('chi-1')
subplot(2,1,2)
plot((1:length(Data(2,2000:end)))/fs,Data(2,2000:end));
xlabel('time(s)')
ylabel('amplitude(uv)')
title('chi-2')

%% Task 2:
% functions use: pwelch
%  fs = 500;
 nfft = 10*fs;
 noverlap = 0.5*fs;
 window = hanning(fs);
[Pxx f] = pwelch(Data(1,2000:end),window,noverlap,nfft,fs);
Pxx_dB = 10*log10(abs(Pxx));
plot(f,Pxx_dB,linewidth=1);
xlabel('frequency(Hz)')
ylabel('PSD(dB)')
title('chi-1')
xlim([1,90])

%% Task 3:
% functions use: spectrogram
% fs = 500;x,window,noverlap,nfft,fs
% overlap_stft = 0.75*fs;
% window_length = fs;
% noverlap = fs;
specgram(Data(2,2000:end),fs,fs,fs,fs*0.75)
xlabel('time(s)')
ylabel('frequency(Hz)')
title('chi-2')
ylim([1,90])
caxis([-20 70])