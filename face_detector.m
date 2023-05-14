% 画像を取り込み
I = imread("image/boy_3.jpg");
imtool(I)

% グレースケールに変える  
G = rgb2gray(I);  

% YCbCr色空間にする  
YCbCr = rgb2ycbcr(I); 
% HSV=rgb2hsv(I);

% 画像のサイズを読む  
heigth = size(G,1);  
width = size(G,2);  

% 肌色モデルにより画像を二値化する　根据肤色模型将图像二值化  
for i = 1:heigth  
    for j = 1:width  
        Y = YCbCr(i,j,1);  
        Cb = YCbCr(i,j,2);  
        Cr = YCbCr(i,j,3);  
        if(Y < 80)  
            G(i,j) = 0;  
        else  
            if(skin(Y,Cb,Cr) == 1)  
                G(i,j) = 255;  
            else  
                G(i,j) = 0;  
            end  
        end  
    end  
end  
imtool(G)

% 形態学処理   
%SE=strel('arbitrary',eye(5));  
SE = strel('arbitrary',eye(5));
disp(eye(5))
disp(SE)
% モルフォロジー"構造化要素" 
% imopenイメージのモルフォロジー オープニング
G = imopen(G,SE);  
% imclose先膨胀再腐蚀  
% G = imclose(gray,SE);  
figure;imtool(G)
% 小さいバイナリオブジェクトを除去
G=bwareaopen(G,200);
imtool(G);

% バイナリオブジェクト（白い部分）をすべて取り出す
[L,num] = bwlabel(G,8);  
STATS = regionprops(L,'area','boundingbox');
% 最大連結域
Ar = cat(1, STATS.Area);
ind = find(Ar ==max(Ar)); % 最大連結域のインデックス
G(find(L~=ind))=0; % 最大連結域以外のところを黒にする
imtool(G);

% n = 1;  
% result = zeros(n,4);  
figure,imshow(I);  
hold on;  
% 最大連結域の座標情報
box = STATS(ind).BoundingBox;  
x = box(1);    % x座標  
y = box(2);    % y座標 
w = box(3);    % 幅  
h = box(4);    % 高さ  

% 縦横比
ratio = h/w; 
x=floor(x); %X の各要素をその要素以下の最も近い整数に丸める
y=floor(y);

% 検出範囲は画像内に抑制する
if x==0
    x = x+1;
end
if y==0
    y=y+1;
end
if w >= width
    w = width-1;
end
if h >= heigth
    h = heigth-1;
end

rectangle('Position',[x,y,w,h],'EdgeColor','b');
hold on;

% 以下の条件を満たす：  
%   1.縦横比は（0.5,2）以内
%   2.findeye == 1   
if ratio < 2.0 && ratio > 0.5  && findeye(G,x,y,w,h) == 1  
% 人の顔に当たる範囲を記録 
%     disp(ratio)
    if ratio > 1.6
        h=0.75*h;
    elseif ratio < 1.0
        w=0.80*w;
    end
    rectangle('Position',[x,y,w,h],'EdgeColor','r');hold on;
    
end
disp('checked')
hold off;