clear; clc;
addpath('A:\Felix\Imaging\Fcns\WavFcns');
set(0,'DefaultFigureWindowStyle','docked')
folder='A:\Felix\ImagingAnalysisFelix\Data\389\20171012_xp109ym183zm31\'; %full path is necessary for two2oneChannel
threshold=.9;%for template matching

%% Change 2 Channel Tif files to 1 Channel Files (optional, only if you have recorded 2 Channels)

%two2oneChannel(folder)

%% Make Wav (folder + files)
makeWavs(folder,5,threshold); %(...,5,...) add 5 seconds from curtain down on

files=dir([folder,'eguiWavs\','*.wav']);
ALLfiles={files(:).name};

for i=1:length(ALLfiles) %optional, helps to find a nice template, shows spectrograms of all (or some) trials
    fulltrial= audioread([folder,'eguiWavs\',ALLfiles{i}]);
    figure
    vigiSpec(fulltrial,40000)
end

%% make template (e.g. in Audacity) before you run this!
addpath(genpath('A:\Felix\MotifFinder'))
run('MotifEditor.m')
