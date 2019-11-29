function param = local_settings()

% fill in these folders and save this file as local_settings.m
param.songdir = 'E:/Users/jccb/Desktop/CaptainMarvel/songdir';
param.hashdir = 'E:/Users/jccb/Desktop/CaptainMarvel/hashdir';
param.filteredir = 'E:/Users/jccb/Desktop/CaptainMarvel/filteredir';

param.audio0 = 'E:/Users/jccb/Desktop/CaptainMarvel/songdir/audio0.wma';
param.audio1 = 'E:/Users/jccb/Desktop/CaptainMarvel/songdir/audio1.wma';
param.audio2 = 'E:/Users/jccb/Desktop/CaptainMarvel/songdir/audio2.wma';

param.hash0 = 'E:/Users/jccb/Desktop/CaptainMarvel/hashdir/hashtable audio0_wma.mat';
param.hash1 = 'E:/Users/jccb/Desktop/CaptainMarvel/hashdir/hashtable audio1_wma.mat';
param.hash2 = 'E:/Users/jccb/Desktop/CaptainMarvel/hashdir/hashtable audio2_wma.mat';

param.fs = 8000;

% window length: 20 ms, but in samples
param.wlen = param.fs*0.02;
% overlap:h
param.olen = param.wlen/2;

% define target window
param.t_mindelta = 1;
param.t_maxdelta = 20;
param.t_freqdiff = 10; % maximum difference in index
