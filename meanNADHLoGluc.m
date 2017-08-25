function [DataOut]=meanNADH(img)

matrixRaw=img;
[MSize, NSize,SSize]=size(matrixRaw);


figure
imshow(mat2gray(double(img(:,:,1))));

matrixMask_1=createMask(imfreehand);
matrixMaskStack_1=matrixRaw(:,:,1)*matrixMask_1;
s1mean=mean(mean(matrixMaskStack_1,2),1);
%s1area=histcounts(nonzeros(matrixMaskStack_1),1);
s1area=histcounts(nonzeros(double((matrixMask_1))),1);

figure
imshow(mat2gray(double(img(:,:,2))));

matrixMask_2=createMask(imfreehand);
matrixMaskStack_2=matrixRaw(:,:,2)*matrixMask_2;
s2mean=mean(mean(matrixMaskStack_2,2),1);
s2area=histcounts(nonzeros(double(matrixMask_2)),1);

figure
imshow(mat2gray(double(img(:,:,3))));

matrixMask_3=createMask(imfreehand);
matrixMaskStack_3=matrixRaw(:,:,3)*matrixMask_3;
s3mean=mean(mean(matrixMaskStack_3,2),1);
s3area=histcounts(nonzeros(double(matrixMask_3)),1);

figure
imshow(mat2gray(double(img(:,:,4))));

matrixMask_4=createMask(imfreehand);
matrixMaskStack_4=matrixRaw(:,:,4)*matrixMask_4;
s4mean=mean(mean(matrixMaskStack_4,2),1);
s4area=histcounts(nonzeros(double(matrixMask_4)),1);

figure
imshow(mat2gray(double(img(:,:,5))));

matrixMask_5=createMask(imfreehand);
matrixMaskStack_5=matrixRaw(:,:,5)*matrixMask_5;
s5mean=mean(mean(matrixMaskStack_5,2),1);
s5area=histcounts(nonzeros(double(matrixMask_5)),1);

figure
imshow(mat2gray(double(img(:,:,6))));

matrixMask_6=createMask(imfreehand);
matrixMaskStack_6=matrixRaw(:,:,6)*matrixMask_6;
s6mean=mean(mean(matrixMaskStack_6,2),1);
s6area=histcounts(nonzeros(double(matrixMask_6)),1);	

meann=mean([s1mean s2mean s3mean s4mean s5mean s6mean]);

DataOut.Stack1=matrixMaskStack_1;
DataOut.Stack2=matrixMaskStack_2;
DataOut.Stack3=matrixMaskStack_3;
DataOut.Stack4=matrixMaskStack_4;
DataOut.Stack5=matrixMaskStack_5;
DataOut.Stack6=matrixMaskStack_6;

DataOut.StackAandI(1,1)=s1area;
DataOut.StackAandI(2,1)=s2area;
DataOut.StackAandI(3,1)=s3area;
DataOut.StackAandI(4,1)=s4area;
DataOut.StackAandI(5,1)=s5area;
DataOut.StackAandI(6,1)=s6area;

DataOut.StackAandI(1,2)=s1mean;     
DataOut.StackAandI(2,2)=s2mean;  
DataOut.StackAandI(3,2)=s3mean;
DataOut.StackAandI(4,2)=s4mean;
DataOut.StackAandI(5,2)=s5mean;
DataOut.StackAandI(6,2)=s6mean;
DataOut.Mean=meann;