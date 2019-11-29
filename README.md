#Projeto Shazam
===


##Primeira entrega: Fazer o fingerprint de 3 audios diferentes.
    Basicamente essa parte consiste em executar o arquivo ´extract_feactures.m´.
    Isso irá criar o fingerprint de todos os audios da pasta ´songdir´ e vai colocá-los na pasta ´hashdir´

##Segunda entrega: Fazer um novo áudio com ruido
    Execute o comando Noise no matlab, isso vai executar o arquivo Noise.m e vai gerar dois audios na pasta
    songdir, um audio com ruido e o audio filtrado.

##Terceira entrega: Fazer um algoritmo que identifique o audio com ruído
    Utilizar extract_features novamente para gerar o fingerprint dos novos audios e depois usar trymatch para
    identificar a música filtrada com alguma das outras músicas.

##Quarta entrega: Aplicar um eco em algum áudio
    Nessa parte, deve-se aplicar um filtro de echo a algum dos audios do songdir. Isso já está implementado em Echos.m
    
---

##Rodando...
    Pra rodar o o projeto é só ir no arquivo ´matchIt.m´ e dar Run pelo live do matlab. Ele vai fazer todas as etapas acima.



