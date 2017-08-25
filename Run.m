%-------------------------------------RUN---------------------------------
%-------------------------------------------------------------------------

%%

clear all
close all
clc

%% Load Files for Islet

tic
I2_2G.Location='/Users/nurinludin/Desktop/6-21-2016/Cx36WT/2-2G.lsm'
I2_2G=OpnFiles2mM(I2_2G);

I2_11G.Location='/Users/nurinludin/Desktop/6-21-2016/Cx36WT/2-11G.lsm'
I2_11G=OpnFiles(I2_11G); 
toc

I2_125M.Location='/Users/nurinludin/Desktop/6-21-2016/Cx36WT/2-125M.lsm'
I2_125M=OpnFiles(I2_125M)

I2_5M.Location='/Users/nurinludin/Desktop/6-21-2016/Cx36WT/2-5M.lsm'
I2_5M=OpnFiles(I2_5M)
%%
% I2_10M.Location='/Users/nurinludin/Desktop/6-21-2016/Cx36WT/2-10M.lsm'
% I2_10M=OpnFiles(I2_10M)

I2.Act2G=Analysis2mM(I2_2G.NormImg.AvgIslet, I2_2G.NormImg.AvgMatrixNorm,I2_2G.NormImg.StdAvgIslet);

thresh=(I2.Act2G.MeanRefStd)
sigmaAvg=I2.Act2G.MeanRefSig


I2.Act11G=Analysis(I2_11G.NormImg.AvgIslet,I2_11G.NormImg.AvgMatrixNorm,I2_11G.NormImg.StdAvgIslet,thresh,sigmaAvg);

% I2.Act125M=Analysis(I2_125M.NormImg.AvgMatrixNorm,thresh,I2.Act2G.MeanRefSig);
% I2.Act5M=Analysis(I2_5M.NormImg.AvgMatrixNorm,thresh,I2.Act2G.MeanRefSig);

I2.Act125M=Analysis(I2_125M.NormImg.AvgIslet,I2_125M.NormImg.AvgMatrixNorm,I2_125M.NormImg.StdAvgIslet,thresh,sigmaAvg);

I2.Act5M=Analysis(I2_5M.NormImg.AvgIslet,I2_5M.NormImg.AvgMatrixNorm,I2_5M.NormImg.StdAvgIslet,thresh,sigmaAvg);
% I2.Act10M=Analysis(I2_10M.NormImg.AvgMatrixNorm,thresh);


%%

disp(sprintf('End of activity and xcorr analysis. Start of duty cycle analysis'))


I2.Duty11G=DutyHi(I2_11G.NormImg.AvgIslet)

amp=I2.Duty11G.Amp;
mn=I2.Duty11G.Min;

I2.Duty2G=DutyLo(I2_2G.NormImg.AvgIslet,amp,mn)

I2.Duty125M=DutyLo(I2_125M.NormImg.AvgIslet,amp,mn)

I2.Duty5M=DutyLo(I2_5M.NormImg.AvgIslet,amp,mn)

% I2.Duty10M=DutyLo(I2.Act10M.Img,amp,mn)

% legend ('11 G', 'Maxima','Minima','Min','0.25*Amp', '0.5*Amp','0.75*Amp','Max', '2 G', '1.25 M', '5 M','Location','Southwest')
% legend ('11 G', '','','','', '','','', '2 G', '1.25 M', '5 M','Location','Northwest')
%%

% filename='/Users/nurinludin/Desktop/6-21-2016/Cx36WT/Islet2CaAnalysis.mat';
% save(filename, 'I2','I2_2G','I2_11G','I2_125M', 'I2_5M') %,'I2_2G_N','I2_11G_N','I2_125M_N', 'I2_5M_N')
% 
% disp(sprintf('End of calcium image analysis. Start of NADH image analysis.'))

%%

I3_2G_N.Location='/Users/nurinludin/Desktop/6-24-2016/Cx36KO/NADH/3-2G.lsm'
I3.NADH.n2G=OpnFilesNADHLoGluc(I3_2G_N)

I3_11G_N.Location='/Users/nurinludin/Desktop/6-24-2016/Cx36KO/NADH/3-11G.lsm'
I3.NADH.n11G=OpnFilesNADH(I3_11G_N)

I3_125M_N.Location='/Users/nurinludin/Desktop/6-24-2016/Cx36KO/NADH/3-125M.lsm'
I3.NADH.n125M=OpnFilesNADH(I3_125M_N)

I3_5M_N.Location='/Users/nurinludin/Desktop/6-24-2016/Cx36KO/NADH/3-5M.lsm'
I3.NADH.n5M=OpnFilesNADH(I3_5M_N)

filename='/Users/nurinludin/Desktop/6-24-2016/Cx36KO/Islet3NADHAnalysis.mat';
save(filename,'I3','I3_2G_N','I3_11G_N','I3_125M_N', 'I3_5M_N')

%%

% 
% I2_10M_N.Location='/Users/nurinludin/Desktop/6-23-2016/Cx36WT/NADH/2-10M.lsm'
% I3.NADH.n10M=OpnFilesNADH(I2_10M_N)
% 
% filename='/Users/nurinludin/Desktop/6-23-2016/Cx36WT/Islet2NADHAnalysis.mat';
% save(filename,'I2','I2_2G_N','I2_11G_N','I2_125M_N', 'I2_5M_N')
%%

