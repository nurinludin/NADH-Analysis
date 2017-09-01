function [DataOut]=meanNADH(img)

matrixRaw=img;
[MSize, NSize,SSize]=size(matrixRaw);

matrixMask=zeros(MSize, NSize);
matrixMaskStack=zeros(MSize, NSize);

% count=1;
for i=1:1:SSize
    
   figure
   imshow(mat2gray(double(matrixRaw(:,:,i))))
   matrixMask=createMask(imfreehand);
   matrixMaskStack=matrixRaw(:,:,i).*matrixMask;
   
   matrixMaskStack(matrixMaskStack==0)=NaN;
   smean(i)=nanmean(nanmean(matrixMaskStack,2),1);
   sarea(i)=length(nonzeros(matrixMask));
   
   DataOut.Mask(:,:,i)=matrixMask;
   DataOut.MaskStack(:,:,i)=matrixMaskStack;
   DataOut.StackMeans(i)=smean(i);
   DataOut.StackAreas(i)=sarea(i);
   
% count=count+1;
   
end

DataOut.Mean=mean(smean);



end

