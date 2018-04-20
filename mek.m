I = double(imread('cameraman.tif'));

x= 256;
y= 256;
v_s = 1;
v_c = (1/3)*v_s;

 c = fspecial('gaussian', [x y], v_c);
 s = fspecial('gaussian', [x y], v_s);
 DoG = c-s;
 
 NEW = conv2(I,DoG);
 
figure(1)
image(DoG,'CDataMapping','scaled')
colormap gray
colorbar;
figure(2)
image(I,'CDataMapping','scaled')
colormap gray
colorbar;
figure(3)
image(NEW,'CDataMapping','scaled')
colormap gray
colorbar;