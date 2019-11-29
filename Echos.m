function Echos(audio_path)

[data, Fs] = audioread(audio_path);
%Lendo o audio, retorna data = dados Fs = Frequencia de leitura

echo_ridiculo = [1, zeros(1,0.2*Fs), 0.8, zeros(1,0.2*Fs),0.6,zeros(1,0.2*Fs), 0.4 ,zeros(1,0.2*Fs), 0.2];
echo_razoavel = [1, zeros(1,0.4*Fs), 0.5, zeros(1,0.4*Fs), 0.2];
echo_reverb = [1, zeros(1,0.2*Fs), 0.2];
%Tres funcoes que sao ss varios impulsos pra convolver com o audio e gerar
%o echo

out_ridiculo = conv(data(:,1),echo_ridiculo);
out_razoavel = conv(data(:,1),echo_razoavel);
out_reverb = conv(data(:,1),echo_reverb);
%Resultados das convolucoes
figure(1)
subplot(2,3,1)
plot(data)
title('Dado lido')

subplot(2,3,2)
plot(out_razoavel)
title('Convolucao razoavel')

subplot(2,3,3)
plot(echo_ridiculo)
title('Echo ridiculo')

subplot(2,3,4)
plot(echo_razoavel)
title('Echo razoavel')

subplot(2,3,5)
plot(echo_reverb)
title('Echo delay')

%Faz os plots pra a gente poder dar uma debugada

player_ridiculo = audioplayer(out_ridiculo, Fs);
player_razoavel = audioplayer(out_razoavel,Fs);
player_reverb = audioplayer(out_reverb, Fs);
%Seta um objeto do tipo player, pra poder tocar as musicas eh so usar:
%   ´play(nome_do_player)´
