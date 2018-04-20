clear all;
%Obraz:
x=256;
y=256;
%Ilość wartsw:
K = 8;
%Wariancje:
%tutaj ustawiasz
pixelParam = 0.5;
v_s = 192;
v_c = (1/3)*v_s;
%dla poszczególnych warstw:
for k = 1:K-1
    v_s(k+1) = v_s(k)*((1/2));
    v_c(k+1) = v_c(k)*((1/2));
end
%Case 1:
n=3;
M = n*v_s;
% 2*M+1:
N = 2*M +1;
%Therefore each DoG(k) is represented by NxN matrix:

for k = 1:K
    
   c(:,:,k+1) = fspecial('gaussian', [N(k) N(k)], v_c(k));
   s(:,:,k+1) = fspecial('gaussian', [N(k) N(k)], v_s(k));
   DoG(:,:,k+1) = c(:,:,k+1)-s(:,:,k+1);
   
end

