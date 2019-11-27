param = local_settings();

[data, Fs] = audioread(param.audio0);

normal = length(data); %Quantidade de dados
aux = 0:normal-1; %Vetor come�ando em 0 unit�riamente iterado at� qnt dados - 1;
T = normal/Fs; % Per�odo � igual a qnt de dados/Frequencia de amostragem => tempo da m�sica
freq = aux/T; %
S = fft(data)/normal;
Test = fft(data);

fc = ceil(normal/2);
%Como o gr�fico � espelhado, s� precisamos da parte esquerda dele
S = S(1:fc);
Test = Test(1:fc)

figure();
plot(freq(1:fc), abs(S));
title('An�lise de espectro');
xlabel('Frequencia em Hertz');
ylabel('Amplitude');

figure();
plot(freq(1:fc), abs(Test));
title('An�lise de espectro teste');
xlabel('Frequencia em Hertz');
ylabel('Amplitude');