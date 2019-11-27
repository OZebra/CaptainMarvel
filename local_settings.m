function param = local_settings()

% fill in these folders and save this file as local_settings.m
param.songdir = 'E:/Users/jccb/Desktop/Projeto_2019.2/songdir';
param.hashdir = 'E:/Users/jccb/Desktop/Projeto_2019.2/hashdir';
param.testfile = 'E:/Users/jccb/Desktop/Projeto_2019.2/songdir/audio2.wma'

param.fs = 8000;

% window length: 20 ms, but in samples
param.wlen = param.fs*0.02;
% overlap:
param.olen = param.wlen/2;

% define target window
param.t_mindelta = 1;
param.t_maxdelta = 20;
param.t_freqdiff = 10; % maximum difference in index
