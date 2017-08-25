function [dat]=OpnFilesNADH(data)

R=bfopen(data.Location);

pic=R{1};
pic=pic(:,1);

for i=1:length(pic)
    img(:,:,i)=pic{i};
end
pic={};

img=double(img);
% mask=data.mask;
[dat]=meanNADHLoGluc(img);
dat.Location=data.Location;
dat.Img=img(:,:,:);


end