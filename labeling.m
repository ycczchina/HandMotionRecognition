close all;clear all;clc;
fileDir=uigetdir('/Users/Zheng/Documents/Graduate/ECE 579/Project/Code/Cambridge-Gesture data base/Set3');
D=dir(fileDir);
picCount=0;
for j=3:length(D)
    fileList=D(j).name;
    expression='00*';
    if(regexp(fileList,expression))
        fileName=[fileDir,'/',fileList];
        D1=dir(fileName);
        white_num=[];
        figure(1);
        axis([0 320 0 240]);
        h = animatedline('Color', 'c');
        count=0;
        for k=3:length(D1)
            filePicList=D1(k).name;
            exp='frame-\w*.jpg';
            if(regexp(filePicList,exp))
                imgName=dir([fileName,'/',filePicList]);
                count=count+1;
                file_name = [fileName,'/',filePicList];
                [out bin] = generate_skinmap(file_name);
                a=find(bin>0);
                white_num(count)=length(a);
                x = floor(a/240);
                y = rem(a, 240);
                b=find(y == 0);
                y(b) = 240;
                I = zeros(240, 320);
                I(a) = 1;
                d=sqrt((x-160).^2+(y-240).^2);
                [d_max,ind]=max(d);
                figure(2);
                if(k==4)
                    subplot(211)
                    imshow(I);
                end
                if(k==40)
                    subplot(212)
                    imshow(I);
                end
%                 imshow(I);
                addpoints(h,x(ind),y(ind));
                drawnow
               
                feature(count,picCount*3+1:picCount*3+3)=[x(ind),y(ind),white_num(count)];
                
            end
            
        end
        picCount=picCount+1;
        disp(fileName);
%         index=find(white_num>0)
%         feature=[feature,white_num(index)];
    end
end
%% Save feature and label
for k=0:19
    for i=1:40
        feat(k*40+i,1:8)=[feature(i,k*3+1),feature(i,k*3+2),feature(i,k*3+3),1,0,0,0,0];
    end
end
save('Set3_0000.mat','feat')