function Analysis=MasterRun(Location)

oLocation=pwd;

cd(Location) %Put your file path to the images, it is the only input

%% Rename Files by character size
% files = dir('*.czi');
% for i=1:length(files)
%     
%   [pathname,filename,extension] = fileparts(files(i).name);
%   % the new name, e.g.
%   [sx sy]=size(filename);
%   newFilename = filename(2:end);
%   % rename the file
%   movefile([filename extension], [newFilename extension]);
% end

%% Retrieving file names



filePattern = fullfile(Location);
list = dir (filePattern );
[B ,index] = sortrows({list.name});
 
[sx,sy]=size(B);
B=B(3:sy);

filePattern_f = fullfile(filePattern, B(:));


for i=1:length(B)
ff=char(filePattern_f(i));
[pathstr,ne{i},ext] = fileparts(ff);
end


cd(oLocation)
close all;

ne = sort_nat(ne);
filePattern_f=sort_nat(filePattern_f);

%% Running analysis through list
for i=22:26 %length(ne)
Loc=char(filePattern_f(i));
nam=char(ne(i));
disp(sprintf('Running analysis for image number %d',i)); 
Analysis.(char(ne{i}))=Run(Loc); %,Analysis.(char(ne{i})) );
close all;
end
%% NADH

for i=1:26

Analysis.Names(i,1)=ne(i);
Analysis.Means(i,1)=Analysis.(char(ne{i})).Mean;
% Analysis.Means(i,2)=Analysis.(char(ne{i})).tdTomPosPercent; %For tdTom
%                                                                and NADH
%                                                                images
% Analysis.Means(i,3)=Analysis.(char(ne{i})).tdTomPosMean;
% Analysis.Means(i,4)=Analysis.(char(ne{i})).tdTomNegMean;

end

Analysis.Overview=[Analysis.Names num2cell(Analysis.Means)]

%% tdTom 

for i=1:26

Analysis.tdTomNames(i,1)=ne(i);
Analysis.tdTomPercent(i,1)=Analysis.(char(ne{i})).tdTomPercent;
Analysis.tdTomMeans(i,1)=Analysis.(char(ne{i})).tdTomMean;
end
Analysis.tdTomOverview=[Analysis.tdTomNames num2cell(Analysis.tdTomPercent) num2cell(Analysis.tdTomMeans)]
%% Organizing To Matrices
Analysis.Names=(ne);
I=['I1'; 'I2' ;'I3' ;'I4' ;'I5'; 'I6'];

count=1;
for i=1:length(ne)

         if isfield(Analysis.(char(ne{i}))(:),'I6')==1
        for j=1:6
            data(count,:)=[Analysis.Names(i) (Analysis.(char(ne{i})).(I(j,:)).RatioActive) (Analysis.(char(ne{i})).(I(j,:)).CorrCoeff)];
            count=count+1;
           
        end
        
         elseif isfield(Analysis.(char(ne{i}))(:),'I5')==1
        for j=1:5
            data(count,:)=[Analysis.Names(i) (Analysis.(char(ne{i})).(I(j,:)).RatioActive) (Analysis.(char(ne{i})).(I(j,:)).CorrCoeff)];
            count=count+1;
           
        end
        
        elseif isfield(Analysis.(char(ne{i}))(:),'I4')==1
        for j=1:4
            data(count,:)=[Analysis.Names(i) (Analysis.(char(ne{i})).(I(j,:)).RatioActive) (Analysis.(char(ne{i})).(I(j,:)).CorrCoeff)];
            count=count+1;
           
        end
        
    elseif isfield(Analysis.(char(ne{i}))(:),'I3')==1
        for j=1:3
            data(count,:)=[Analysis.Names(i) (Analysis.(char(ne{i})).(I(j,:)).RatioActive) (Analysis.(char(ne{i})).(I(j,:)).CorrCoeff)];
            count=count+1;
           
        end
        
    elseif isfield(Analysis.(char(ne{i}))(:),'I2')==1
                  for j=1:2
            data(count,:)=[Analysis.Names(i) (Analysis.(char(ne{i})).(I(j,:)).RatioActive) (Analysis.(char(ne{i})).(I(j,:)).CorrCoeff)];
            count=count+1;
                  end
%          meandata(i,:)=[Analysis.Names(i) mean([Analysis.(char(ne{i})).(I(1,:)).RatioActive Analysis.(char(ne{i})).(I(2,:)).RatioActive]);
    elseif isfield(Analysis.(char(ne{i}))(:),'I1')==1
        j=1;
            data(count,:)=[Analysis.Names(i) Analysis.(char(ne{i})).(I(j,:)).RatioActive Analysis.(char(ne{i})).(I(j,:)).CorrCoeff];
            count=count+1;
%         meandata(i,:)=[Analysis.Names(i) Analysis.(char(ne{i})).(I(1,:)).RatioActive];
    end

    
end

Analysis.DataOverview=data;

%% Saving

save('I:\Nurin\JoshData\Analysis\MatlabFiles\042617.mat','Analysis_042617', '-v7.3')

%% Removing a field from the structure
for i=1:length(ne)
    
    if isfield(Analysis.(char(ne{i}))(:),'I3')==1
        for j=1:3
            Analysis.(char(ne{i})).(I(j,:))=rmfield(Analysis.(char(ne{i})).(I(j,:)),'images');
        end
        
    elseif isfield(Analysis.(char(ne{i}))(:),'I2')==1
                  for j=1:2
           Analysis.(char(ne{i})).(I(j,:))=rmfield(Analysis.(char(ne{i})).(I(j,:)),'images');
                  end
%          
    elseif isfield(Analysis.(char(ne{i}))(:),'I1')==1
        j=1;
            Analysis.(char(ne{i})).(I(j,:))=rmfield(Analysis.(char(ne{i})).(I(j,:)),'images');
%        
    end

    
end




%%
% 
% close all
% 
% WT_2G_I1.Location='L:\Images\MH\04-19-2017\WT_2G_I1.czi';
% WT_2G_I1=Run(WT_2G_I1);
% 
% WT_11G_I1.Location='L:\Images\MH\04-19-2017\WT_11G_I1.czi';
% WT_11G_I1=Run(WT_11G_I1);
% 
% WT_11G_3MH_I1.Location='L:\Images\MH\04-19-2017\WT_11G_3MH_I1.czi';
% WT_11G_3MH_I1=Run(WT_11G_3MH_I1);
% 
% WT_2G(4,:)=[WT_2G_I1.RatioActive WT_2G_I1.HiCorrCoeff WT_2G_I1.DutyCycle];
% WT_11G(4,:)=[WT_11G_I1.RatioActive WT_11G_I1.HiCorrCoeff WT_11G_I1.DutyCycle];
% WT_11G_3MH(4,:)=[WT_11G_3MH_I1.RatioActi ve WT_11G_3MH_I1.HiCorrCoeff WT_11G_3MH_I1.DutyCycle];
%   
% WT_data=[WT_2G(:,1) WT_11G(:,1) WT_11G_3MH(:,1) ...
%                   WT_2G(:,2) WT_11G(:,2) WT_11G_3MH(:,2) ...
% WT_2G(:,3) WT_11G(:,3) WT_11G_3MH(:,3)]

%%


%%
% cd(home)
% save('Exp6b_B6.mat', 'B6_*')
% save('Exp6b_WT.mat', 'WT_*')
% save('Exp6b_WT.mat', 'WT_*')

    