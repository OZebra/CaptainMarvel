function Noise(audio_path)

[data, Fs] = audioread(audio_path); %Carrega o audio
data_size = length(data); %Guarda quantidade de amostras em data_size
%Ex:
%   Se a música tiver 3 segundos a uma frequência de amostragem de 8000Hz,
%   data_size = 3*8000;
%
t = 0:1/Fs:data_size/Fs-1/Fs; %Vetor com as componentes dt
%Esse vetor é gerado no intervalo 0 ~ (data_size/Fs) - 1/Fs.
%Isso significa que ele vai guardar os tempos de amostragem de cada
%componente amostrada de data.
figure(2)
subplot(2,3,1);plot(t,data);title('Data x t');xlabel('Tempo (s)');ylabel('Amplitude');
%Plotando o gráfico para vizualização

noise = 2e-2*sin(2*pi*500*t);
cdata = data;
data = data + noise';

%Aqui, definimos uma senoide para ser nosso ruido, e aplicamos esse ruido
%em data, fazendo assim com que seja possível agora escutar um zumbido na
%musica (ruido).

furData = fft(cdata)/data_size; %Transformada de fourier do audio com aplitude normalizada.
furFreq = (0:length(furData)-1)*Fs/length(furData);
%Vetor de frequências para o plot. Esse vetor nos ajuda a plotar cada
%frequencia amostrada.
subplot(2,3,6);plot(furFreq, abs(furData));title('Fourrier Data original');xlabel('Frequencia (w)');ylabel('Amplitude');


furData = fft(data)/data_size; %Transformada de fourier do audio com aplitude normalizada.
furFreq = (0:length(furData)-1)*Fs/length(furData);
%Vetor de frequências para o plot. Esse vetor nos ajuda a plotar cada
%frequencia amostrada.
subplot(2,3,2);plot(furFreq, abs(furData));title('Fourrier Data x w');xlabel('Frequencia (w)');ylabel('Amplitude');
%plota o fourier

fShift = (-data_size/2:data_size/2-1)*(Fs/data_size);
furDataShift = fftshift(furData);
subplot(2,3,3);plot(fShift, abs(furDataShift));title('Fourrier Data Shifted x w');xlabel('Frequencia (w)');ylabel('Amplitude');
%Essa parte acima basicamente só vai plotar o fourier com o shift pra ficar
%mais condizente com o que vemos na disciplina, uma função espelhada em 0.

begFreq = 496 / (Fs/2);
endFreq = 504 / (Fs/2);
%Aqui, setamos as frequencias do nosso filtro. Ele vai remover do audio as
%frequencias entre 522.25 e 524.25. é importante frisar que a divisao por
%(Fs/2) serve para normalizar a frequencia para utilizar a funcao butter()
%pois essa funcao nao aceita valores superiores a 1.

[b,a] = butter(5, [begFreq, endFreq], 'stop');
%Utiliza a funcao butter para criar um filtro que vai remover as
%componentes entre begFreq e endFreq do sinal.
filtered_data = filter(b,a,data);
filtered_data = filter(b,a,filtered_data);
filtered_data = filter(b,a,filtered_data);
%Filtra o sinal;
subplot(2,3,4);plot(t, filtered_data);title('Filtered data');xlabel('Tempo (s)');ylabel('Amplitude');
%Plota o sinal filtrado.


ffurData = fft(filtered_data)/length(filtered_data);
ffurFreq = (0:length(ffurData)-1)*Fs/length(ffurData);
subplot(2,3,5);plot(ffurFreq, abs(ffurData));title('Filtered fourrier');xlabel('Frequencia (w)');ylabel('Amplitude');
%Plota a transformada de fourier, eh possivel ver comparando-o com os plots
%anteriores que a componente senoidal(ruido) nao esta mais presente.

player_noise = audioplayer(data, Fs);
player_filtrado = audioplayer(filtered_data, Fs);

data = data/max(abs(data));
audiowrite('filteredir/Audio_Ruido.wav', data, Fs); %Cria o arquivo de audio com ruido

filtered_data = filtered_data/max(abs(filtered_data));
audiowrite('filteredir/Audio_Filtrado.wav', filtered_data, Fs); %Cria o arquivo de audio com ruido


%Seta dois players, um para o audio com ruido e um para o audio filtrado
%Para rodalos basta executar ´play(nome_do_player)´

