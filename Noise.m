param = local_settings();

[data, Fs] = audioread(param.audio2);

normal = length(data);
aux = 0:length(data)-1;
T = normal/Fs;
freq = aux/T;
fc = ceil(normal/2);

n = 0:1/Fs:(length(data)-1)/Fs; %Cria vetor com tamanho de fs
noise = sin(2*pi*50*n); %Cria função seno para usar de ruido

noise = noise'; %inverte colunas e linhas
data_ruido = noise + data; %adiciona o ruido

player_normal = audioplayer(data, Fs);
player_ruido = audioplayer(data_ruido, Fs);

[furData, f1] = myfft(data, Fs);
[furData_ruido, f2] = myfft(data_ruido, Fs);
[furNoise, f3] = myfft(noise, Fs);
% 
% subplot(2,3,1)
% plot(freq(1:fc), abs(furData));
% title('Fourrier data');
% 
% subplot(2,3,4)
% plot(data);
% title('Data');
% 
% subplot(2,3,2)
% plot(freq(1:fc), abs(furData_ruido));
% title('Fourrier data com ruido');
% 
% subplot(2,3,5);
% plot(data_ruido);
% title('Data com ruido');
% 
% subplot(2,3,3)
% plot(freq(1:fc), abs(furNoise));
% title('Fourrier do noise');
% 
% subplot(2,3,6);
% plot(noise);
% title('Noise');

%teste = out_ridiculo/max(abs(out_ridiculo));  
%out = out_ridiculo/max(abs(out_ridiculo));
%audiowrite('songdir/teste.wav', out, Fs);

