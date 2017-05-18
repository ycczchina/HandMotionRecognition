%training.m
close all;clear all;clc;
%% Create feature & label matrix
 for k=1:2
    for j=0:7
        if(j<5)
            str=['/Users/Zheng/Documents/Graduate/ECE 579/Project/Code/Set',num2str(k),'_000',num2str(j),'.mat'];
            load(str);
            for i=1:20
                feature(1:40,(k-1)*140+j*20+i)=feat((i-1)*40+1:(i-1)*40+40,1);
                feature(41:80,(k-1)*140+j*20+i)=feat((i-1)*40+1:(i-1)*40+40,2);
                feature(81:120,(k-1)*140+j*20+i)=feat((i-1)*40+1:(i-1)*40+40,3);
                label(1:5,(k-1)*140+j*20+i)=feat(i*40,4:8)';
            end
        end
        if(j>5)
            str=['/Users/Zheng/Documents/Graduate/ECE 579/Project/Code/Set',num2str(k),'_000',num2str(j),'.mat'];
            load(str);
            for i=1:20
                feature(1:40,(k-1)*140+(j-1)*20+i)=feat((i-1)*40+1:(i-1)*40+40,1);
                feature(41:80,(k-1)*140+(j-1)*20+i)=feat((i-1)*40+1:(i-1)*40+40,2);
                feature(81:120,(k-1)*140+(j-1)*20+i)=feat((i-1)*40+1:(i-1)*40+40,3);
                label(1:5,(k-1)*140+(j-1)*20+i)=feat(i*40,4:8)';
            end
        end
    end
 end
% feature=feature';
% label=label';
save('feature.mat','feature');
save('label.mat','label');