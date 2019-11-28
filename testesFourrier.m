param = local_settings();

% Fs1 = 50;
% t1 = 0:1/Fs:data_size/Fs-1/Fs;
% data1 = sin(2*pi*15*t) + sin(2*pi*30*t);

[data, Fs] = audioread(param.audio2);
data_size = length(data);
t = 0:1/Fs:data_size/Fs-1/Fs;

subplot(2,3,1);plot(t,data);title('Data x t');xlabel('Tempo');ylabel('Amplitude');

furData = fft(data)/data_size;
furFreq = (0:length(furData)-1)*Fs/length(furData);
subplot(2,3,2);plot(furFreq, abs(furData));title('Fourrier Data x w');xlabel('Frequencia');ylabel('Amplitude');

fShift = (-data_size/2:data_size/2-1)*(Fs/data_size);
furDataShift = fftshift(furData);
subplot(2,3,3);plot(fShift, abs(furDataShift));title('Fourrier Data Shifted x w');xlabel('Frequencia');ylabel('Amplitude');

n = 0:1/Fs:(length(data)-1)/Fs; %Cria vetor com tamanho de fs
noise = sin(2*pi*1000*n); %Cria fun��o seno para usar de ruido

% player_normal = audioplayer(data, Fs);
% player_ruido = audioplayer(data_ruido, Fs);

% subplot(2,3,1)
% plot(freq(1:fc), abs(furData));
% title('Fourrier data');

%Exibe os dados de fourrier de um audio

