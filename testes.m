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
plot(data)
title('Dado lido')

figure(2)
plot(out_razoavel)
title('Convolução razoável')

figure(3)
plot(echo_ridiculo)
title('Echo ridiculo')

figure(4)
plot(echo_razoavel)
title('Echo razoável')

figure(5)
plot(echo_reverb)
title('Echo delay')

player_normal = audioplayer(data, Fs);
player_ridiculo = audioplayer(out_ridiculo, Fs);
player_razoavel = audioplayer(out_razoavel,Fs);
player_reverb = audioplayer(out_reverb, Fs);
