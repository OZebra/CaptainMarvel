param = local_settings();

[data, Fs] = audioread(param.testfile);
%Lendo o audio, retorna data = dados Fs = Frequência de leitura

echo_ridiculo = [1, zeros(1,0.2*Fs), 0.8, zeros(1,0.2*Fs),0.6,zeros(1,0.2*Fs), 0.4 ,zeros(1,0.2*Fs), 0.2];
echo_razoavel = [1, zeros(1,0.4*Fs), 0.5, zeros(1,0.4*Fs), 0.2];
echo_reverb = [1, zeros(1,0.2*Fs), 0.2];

out_ridiculo = conv(data(:,1),echo_ridiculo);
out_razoavel = conv(data(:,1),echo_razoavel);
out_reverb = conv(data(:,1),echo_reverb);

figure(1)
title('Dado lido')
plot(data)

figure(2)
title('Convolução Razoável')
plot(out_razoavel)

figure(3)
title('Echo ridiculo')
plot(echo_ridiculo)

figure(4)
title('Echo razoável')
plot(echo_razoavel)

figure(5)
title('Echo delay')
plot(echo_reverb)

player_ridiculo = audioplayer(out_ridiculo, Fs);
player_razoavel = audioplayer(out_razoavel,Fs);
player_reverb = audioplayer(out_reverb, Fs);
