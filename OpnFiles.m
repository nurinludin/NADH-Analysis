function [dat]=OpnFiles(data,G2mMData, start,endd)


R=bfopen(data.Location);

pic=R{1};
pic=pic(:,1);

for i=1:length(pic)
    img(:,:,i)=pic{i};
end
 pic={};

img=double(img);
% mask=data.mask;

[MSize,NSize,TSize]=size(img);

if start==0 && endd==0
    start=1;
    endd=TSize;
end

dat.NormImg=ImgPrep(img,start,endd);

disp(sprintf('End of image prep. Start of activity and xcorr analysis.'))

thresh=(G2mMData.Act2G_1.MeanRefStd);
sigmaAvg=G2mMData.Act2G_1.MeanRefSig;


disp(sprintf('select first islet'))
dat.Act_1=Analysis(dat.NormImg.AvgIslet,dat.NormImg.AvgMatrixNorm,dat.NormImg.StdAvgIslet,thresh,sigmaAvg);

thresh=(G2mMData.Act2G_2.MeanRefStd);
sigmaAvg=G2mMData.Act2G_2.MeanRefSig;

disp(sprintf('select second islet'))
dat.Act_2=Analysis(dat.NormImg.AvgIslet,dat.NormImg.AvgMatrixNorm,dat.NormImg.StdAvgIslet,thresh,sigmaAvg);

% thresh=(G2mMData.Act2G_3.MeanRefStd);
% sigmaAvg=G2mMData.Act2G_3.MeanRefSig;
% 
% disp(sprintf('select third islet'))
% dat.Act_3=Analysis(dat.NormImg.AvgIslet,dat.NormImg.AvgMatrixNorm,dat.NormImg.StdAvgIslet,thresh,sigmaAvg);
% 


% [dat]=Analysis(dat.NormImg.AvgMatrixNorm,thresh);
dat.Location=data.Location;
dat.Img=img(:,:,start:endd);


end