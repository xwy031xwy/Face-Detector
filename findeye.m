function eye = findeye(bImage,x,y,w,h)  
disp(h)
% 二值化  
for i = y:(y+h)  
    for j = x:(x+w) 
        if bImage(i,j) ==0
            part(i-y+1,j-x+1) = 255;
        else %if bImage(i,j) == 255  
            part(i-y+1,j-x+1) = 0;  
        end  
    end  
end
% disp('h')
% disp(h)
% disp('y+h')
% disp(y+h)
% disp('i')
% disp(i)
% disp('j')
% disp(j)  

% disp(size(part))
% imtool(imcrop(bImage,[x,y,x+w,y+h]))
% imtool(part)
% 目に表す矩形の面積と全体が一定の比例に超えない
% 髪、背景などを考慮して、Rを0.5にする
% R = 0.5; % 比例値R
% S_f = w*h;
% disp('f')
% disp(S_f)
% S_e = bwarea(part); 
% disp(S_e)
[L,num] = bwlabel(part,8);  
% bwlabelにより二つ以上の矩形を検出すれば、目があるとみなす
if num>=2
    eye = 1;  
else 
    eye = 0;  
end  
