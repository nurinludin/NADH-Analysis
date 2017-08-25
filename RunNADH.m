    % clear all
close all
clc  

N8210_2G_I7.Location='/Volumes/NL/Images/GK/Exp7/PartB/NADH/N8210_2G_I7.lsm';
N8210_2G_I7=OpnFilesNADH(N8210_2G_I7);

N8210_20G_I7.Location='/Volumes/NL/Images/GK/Exp7/PartB/NADH/N8210_20G_I7.lsm';
N8210_20G_I7=OpnFilesNADH(N8210_20G_I7);

N8210_20G_10MH_I7.Location='/Volumes/NL/Images/GK/Exp7/PartB/NADH/N8210_20G_10MH_I7.lsm';
N8210_20G_10MH_I7=OpnFilesNADH(N8210_20G_10MH_I7);


N8210_10MH_Mean(7,:)=[N8210_2G_I7.Mean; N8210_20G_I7.Mean; N8210_20G_10MH_I7.Mean]

