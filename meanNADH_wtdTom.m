function [DataOut]=meanNADH_wtdTom(img)

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
   
   matrixMaskStack=DataOut.MaskStack(:,:,count);
   BW = imbinarize(img1, 'global');
   matrixMaskStack_pos=BW.*matrixMaskStack;
   areaTomPos(count)=size(nonzeros(BW),1);
   
   tdTomneg=zeros(MSize, NSize);
   tdTomneg=DataOut.Mask(:,:,count);
   tdTomneg(BW)=0;
   matrixMaskStack_neg=tdTomneg.*matrixMaskStack;
   areaTomNeg(count)=size(nonzeros(tdTomneg),1);


DataOut.AreaTom(count)=areaTomPos(count);
DataOut.StacktdTomPosPercent(count)=areaTomPos(count)/sarea(count);

DataOut.StacktdTomNegPercent(count)=areaTomNeg(count)/sarea(count);


DataOut.tdTomPosMean(count)=nanmean(nanmean(matrixMaskStack_pos,2),1);
DataOut.tdTomPosMaskStack(:,:,count)= BW;
DataOut.tdTomPosIntensityStack(:,:,count)= matrixMaskStack_pos;


DataOut.tdTomNegMean(count)=nanmean(nanmean(matrixMaskStack_neg,2),1);
DataOut.tdTomNegMaskStack(:,:,count)= tdTomneg;
DataOut.tdTomNegIntensityStack(:,:,count)= matrixMaskStack_neg;

count=count+1;
end

DataOut.tdTomPosPercent=mean(DataOut.StacktdTomPosPercent);
DataOut.tdTomPosMean=mean(DataOut.tdTomPosMean);

DataOut.tdTomNegPercent=mean(DataOut.StacktdTomNegPercent);
DataOut.tdTomNegMean=mean(DataOut.tdTomNegMean);


end

