% Class 1: j=0 or 3
% Class 2: j=1 or 4
% Class 3: j=2
% Class 4: j=6
% Class 5: j=7
close all;clear all;clc;
k=3;                    % Set number
j=randi(7);
if(j<6)
    j=j-1;
end
% j=2;                    

str=['/Users/Zheng/Documents/Graduate/ECE 579/Project/Code/Set',num2str(k),'_000',num2str(j),'.mat'];
load(str);
% i-th image sequece, between 1 and 20
i=randi(20)-1;
X(1:40,1)=feat((i-1)*40+1:(i-1)*40+40,1);
X(41:80,1)=feat((i-1)*40+1:(i-1)*40+40,2);
X(81:120,1)=feat((i-1)*40+1:(i-1)*40+40,3);
Y = myNeuralNetworkFunction(X)
[value,class]=max(Y);
j                       % Class number
class