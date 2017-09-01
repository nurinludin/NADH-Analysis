function [dat]=Run(data)

R=bfopen(data);

pic=R{1};
pic=pic(:,1);

for i=1:length(pic)
    img(:,:,i)=pic{i};
end
pic={};

img=double(img);
% [dat]=meanNADH(img); %for images with NAD(P)H ONLY
[dat]=meanNADH_wtdTom(img); %for images with NAD(P)H and tdTom fluor
dat.Location=data;
dat.Img=img(:,:,:);


end