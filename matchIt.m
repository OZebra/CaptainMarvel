%%
%Setando os parâmetros base
param = local_settings();
songdir = param.songdir;
hashdir = param.hashdir;
filteredir = param.filteredir;
%%
%1) Gerando as hashs dos audios da pasta songdir
extract_features;
%%
%2) Aplicando o ao param.audio2 -> Gera arquivos Audio_filtrado e audio_ruido na
%pasta songdir.
%É possivel escutar os audios utilizando o comando play(player_noise) e play(player_filtrado)
Noise(param.audio2);
%%
%3) Identiticando música com
[toMatch, Fs] = audioread(param.audio0); %Ao final da execucao o nome da musica deve ser audio0 =D

d = dir(songdir);
dlen = length(d);
songnames = cell(dlen-2,1);
for d_ind = 3:dlen,
    sn = d(d_ind).name;
    songnames{d_ind-2} = sn(1:length(sn));
end

%Cria vetor com os nomes das músicas

save songnames songnames;
num_s = length(songnames);

score = cell(dlen-2,1); %Cria vetor que vai guardar os resultados

for s_ind = 1:num_s,
    disp('Processando...');
    filename = fullfile(songdir,songnames{s_ind});
    snFormatado = strrep(songnames{s_ind},'.','_');
    hashname = fullfile(hashdir,sprintf('hashtable %s.mat',snFormatado));
    load(hashname);
    score{s_ind} = trymatch(toMatch, localhash);
    %Nesse for, para cada indicie do vetor de músicas ele carrega a hash
    %dessa música e compara a música toMatch desejada com a hash da música
    %correspondente aquele indicie. Ele salva os resultados num vetor Score
    %que vai guardar as pontuacoes das musicas na mesma ordem do vetor
    %songnames
end

score = score'; %Transforma score de linhas pra colunas
startComp = 0; %Valor inicial de pontuacao
compResult = 0; %Vencedor inicial da comparacao

for index = 1:length(score),
    if(startComp < score{index})
        startComp = score{index};
        compResult = index;
    end
    %Nesse for basicamente eu pego qual a maior pontuacao e salvo o indicie
    %dela jah que esse indicie vai ser correspondente ao nome da musica no
    %vetor songnames
end

res = sprintf('A música identificada foi: %s.', songnames{compResult});
disp(res);
%Exibe a musica identificada.


%%
%4)Aplicar um Echo a algum dos audios;
%Essa função vai aplicar 3 echos com intensidades diferentes na música
%desejada e disponibilizar os players para que o usuario as escute.
%os players sao:
% play(player_reverb)
% play(player_razoavel)
% play(player_ridiculo)
%
%Os echos estao em ordem de itensidade do mais fraco pra o mais forte.
Echos(param.audio2);
