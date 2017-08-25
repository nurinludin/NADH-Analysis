function [dat]=Run(data)

R=bfopen(data);

pic=R{1};
pic=pic(:,1);

for i=1:length(pic)
    img(:,:,i)=pic{i};
end
pic={};

img=double(img);
% mask=data.mask;
[dat]=meanNADH(img);
dat.Location=data;
dat.Img=img(:,:,:);


end