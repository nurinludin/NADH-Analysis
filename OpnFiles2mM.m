function [dat]=OpnFiles2mM(data, start, endd)


% R=bfopen(data.Location);
R=bfopen(data.Location);
pic=R{1};
pic=pic(:,1);

for i=1:length(pic)
    img(:,:,i)=pic{i};
end
pic={};

img=double(img);
% mask=data.mask;

% size(img)

[MSize,NSize,TSize]=size(img);

if start==0 && endd==0
    start=1;
    endd=TSize;
end

dat.NormImg=ImgPrep(img,start,endd);

disp(sprintf('End of image prep for 2mM Glucose images. Start of activity and xcorr analysis.'))
disp(sprintf('Select islet and four quiet cells.'))

disp(sprintf('select first islet'))

dat.Act2G_1=Analysis2mM(dat.NormImg.AvgIslet, dat.NormImg.AvgMatrixNorm,dat.NormImg.StdAvgIslet);

disp(sprintf('select second islet'))
dat.Act2G_2=Analysis2mM(dat.NormImg.AvgIslet, dat.NormImg.AvgMatrixNorm,dat.NormImg.StdAvgIslet)

% disp(sprintf('select third islet'))
% dat.Act2G_3=Analysis2mM(dat.NormImg.AvgIslet, dat.NormImg.AvgMatrixNorm,dat.NormImg.StdAvgIslet)

% [dat]=Analysis2mM(dat.NormImg.AvgMatrixNorm);
% dat.Location=data.Location;
dat.Img=img(:,:,start:endd);


end