#Projeto Shazam
===

Neste projeto, o objetivo  ́e identificar um audio, assim como o aplicativo
shazam, usando conceitos aprendidos na disciplina de sinais e sistemas, como
Transformada de Fourier e Filtros.
Para isso, os estudantes ir ̃ao utiliza o MATLAB para simula ̧c ̃ao desse
sistema e o microfone do computador. Ao final desse projeto o/a estudante
ver ́a conceitos de sinais e sistemas em aplica ̧c ̃oes reais do dia-a-dia.

##Preparação de ambiente
---

Para utilizar esse esqueleto, devemos converter a música para .wav 
Para isso você pode utlizar https://www.coolutils.com/online/Audio-Converter/

##Primeira Parte: Criação dos fingerprints da música
---

1. Copie o código em `local_settings_sample.m` e cole em um outro arquivo, que você irá chamar de `local_settings.m`. Em `local_settings.m`, Modifique os diretorios de `songdir` e `hashdir` , para onde ela está localizada.
	1.1 `songdir` -> Irá conter os audios no formato de .wav, mono e com a frequencia de amostragem 8kHz.
2. Logo após rode `extract_features.m` , esse código irá criar uma hashtable com cada audio em um arquivo .mat


##Segunda Parte: Reconhecimento de Aúdio
---

OBS: 	trymatch.m -> Função de busca na hash, baseado no artigo disponivel em Material de Apoio
	get_fingerprint.m -> Função que fara o fingerprint que estará salvo na hash. Função baseada no artigo disponivel em Material de Apoio


