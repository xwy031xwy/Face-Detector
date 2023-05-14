function result = skin(Y,Cb,Cr)  
% 参数  
% a = 25.39;  
% b = 14.03;  
% ecx = 1.60;  
% ecy = 2.41;  
% sita = 2.53;  
% cx = 109.38;  
% cy = 152.02;  
% xishu = [cos(sita) sin(sita);-sin(sita) cos(sita)];  
% if(Y > 230)  
%     a = 1.1*a;  
%     b = 1.1*b;  
% end  
% Cb = double(Cb);  
% Cr = double(Cr);  
% t = [(Cb-cx);(Cr-cy)];  
% temp = xishu*t;  
% value = (temp(1) - ecx)^2/a^2 + (temp(2) - ecy)^2/b^2;  
% 
% if value > 1  
%     result = 0;  
% else  
%     result = 1;  
if 0<=Y && Y<=255 && 135<=Cr && Cr<=180 && 85<=Cb && Cb<=135
    result = 1;  
else  
    result = 0; 
% if 0 <=H &&H<=50 && 0.23<=S && S<=0.68 && R>95 &&G>40 && B>20 && R>G && R>B && ...
%     abs(R-G)>15  %&& A>15
%     result=1;
% else
%     result=0;
end  
