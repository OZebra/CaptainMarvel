param = local_settings();

[data, Fs] = audioread(param.audio0);

normal = length(data); %Quantidade de dados
aux = 0:normal-1; %Vetor começando em 0 unitáriamente iterado até qnt dados - 1;
T = normal/Fs; % Período é igual a qnt de dados/Frequencia de amostragem => tempo da música
freq = aux/T; %
S = fft(data)/normal;
Test = fft(data);

fc = ceil(normal/2);
%Como o gráfico é espelhado, só precisamos da parte esquerda dele
S = S(1:fc);
Test = Test(1:fc)

figure();
plot(freq(1:fc), abs(S));
title('Análise de espectro');
xlabel('Frequencia em Hertz');
ylabel('Amplitude');

figure();
plot(freq(1:fc), abs(Test));
title('Análise de espectro teste');
xlabel('Frequencia em Hertz');
ylabel('Amplitude');