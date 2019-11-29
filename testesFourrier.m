param = local_settings();

% Fs1 = 50;
% t1 = 0:1/Fs:data_size/Fs-1/Fs;
% data1 = sin(2*pi*15*t) + sin(2*pi*30*t);

[data, Fs] = audioread(param.audio2);
data_size = length(data);
t = 0:1/Fs:data_size/Fs-1/Fs;
subplot(2,3,1);plot(t,data);title('Data x t');xlabel('Tempo');ylabel('Amplitude');

noise = 1e-2*sin(2*pi*523.25*t);
data = data + noise';

furData = fft(data)/data_size;
furFreq = (0:length(furData)-1)*Fs/length(furData);
subplot(2,3,2);plot(furFreq, abs(furData));title('Fourrier Data x w');xlabel('Frequencia');ylabel('Amplitude');

fShift = (-data_size/2:data_size/2-1)*(Fs/data_size);
furDataShift = fftshift(furData);
subplot(2,3,3);plot(fShift, abs(furDataShift));title('Fourrier Data Shifted x w');xlabel('Frequencia');ylabel('Amplitude');

begFreq = 522.25 / (Fs/2);
endFreq = 524.25 / (Fs/2);%Normalizando frequencias para a funcao butter;

[b,a] = butter(2, [begFreq, endFreq], 'stop');
filtered_data = filter(b,a,data);
subplot(2,3,4);plot(t, filtered_data);title('Filtered data');

ffurData = fft(filtered_data)/length(filtered_data);
ffurFreq = (0:length(ffurData)-1)*Fs/length(ffurData);
subplot(2,3,5);plot(ffurFreq, abs(ffurData));title('Filtered fourrier');

player_normal = audioplayer(data, Fs);
player_noise = audioplayer(data_noise, Fs);
player_filtrado = audioplayer(filtered_data, Fs);

% subplot(2,3,1)
% plot(freq(1:fc), abs(furData));
% title('Fourrier data');

%Exibe os dados de fourrier de um audio

