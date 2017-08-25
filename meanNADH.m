function [DataOut]=meanNADH(img)

matrixRaw=img;
[MSize, NSize,SSize]=size(matrixRaw);

matrixMask=zeros(MSize, NSize);
matrixMaskStack=zeros(MSize, NSize);

count=1;
for i=1:2:SSize-1
    
   figure
   imshow(mat2gray(double(matrixRaw(:,:,i))))
   matrixMask=createMask(imfreehand);
   matrixMaskStack=matrixRaw(:,:,i).*matrixMask;
   
   matrixMaskStack(matrixMaskStack==0)=NaN;
   smean(count)=nanmean(nanmean(matrixMaskStack,2),1);
   sarea(count)=length(nonzeros(matrixMask));
   
   DataOut.Mask(:,:,count)=matrixMask;
   DataOut.MaskStack(:,:,count)=matrixMaskStack;
   DataOut.StackMeans(count)=smean(count);
   DataOut.StackAreas(count)=sarea(count);
   
count=count+1;
   
end

DataOut.Mean=mean(smean);

%% For tdTom and NADH areas
count=1;

for i=2:2:(SSize)
   img1=mat2gray(double(matrixRaw(:,:,i)));
   
   matrixMask=DataOut.MaskStack(:,:,count);
   BW = imbinarize(img1, 'global');
   matrixMaskStack=BW.*matrixMask;
 

areaTom(count)=size(nonzeros(BW),1);

DataOut.AreaTom(count)=areaTom(count);
DataOut.StacktdTomPercent(count)=areaTom(count)/sarea(count);


DataOut.StacktdTomMean(count)=nanmean((matrixMaskStack(~isnan(matrixMaskStack))));
count=count+1;
end

DataOut.tdTomPercent=mean(DataOut.StacktdTomPercent);
DataOut.tdTomMean=mean(DataOut.StacktdTomMean);


end

