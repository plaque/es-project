clear all;

B = generate_dyadic_grid(8, 256, 256, 90);

function B = generate_dyadic_grid(n_layers, x_dim_size, y_dim_size, variance_surround)
%%% Gaussian Kernels:
    n_layers = 8; %liczba warstw
%Warunek: variance_center < variance_surround and variance_center = (1/3) variance_surround
%    variance_surround = 90;
    variance_center = (1/3)*variance_surround;
    
%Wagi dla Gaussianów:
    w_c = 1;
    w_s = 1;
    
    for k = 1:n_layers

       c = fspecial('gaussian', [x_dim_size/(2^(k-1)) y_dim_size/(2^(k-1))], variance_center/(2^(k-1)));
       s = fspecial('gaussian', [x_dim_size/(2^(k-1)) y_dim_size/(2^(k-1))], variance_surround/(2^(k-1)));
       DoG = c-s;
       B(:,:,k+1) = repmat(DoG,2^(k-1));

%        figure(k)
%        image(B(:,:,k+1),'CDataMapping','scaled')
%        colormap gray
%        colorbar;
    end
end

% %%% Gaussian Kernels:
%     n = 8; %liczba warstw
%     x = 256;
%     y = 256;
% %Warunek: variance_center < variance_surround and variance_center = (1/3) variance_surround
%     variance_surround = 90;
%     variance_center = (1/3)*variance_surround;
%     
% %Wagi dla Gaussianów:
%     w_c = 1;
%     w_s = 1;
%     
% for k = 1:n
%     
%    c = fspecial('gaussian', [x/(2^(k-1)) y/(2^(k-1))], variance_center/(2^(k-1)));
%    s = fspecial('gaussian', [x/(2^(k-1)) y/(2^(k-1))], variance_surround/(2^(k-1)));
%    DoG = c-s;
%    B(:,:,k+1) = repmat(DoG,2^(k-1));
%    
%    figure(k)
%    image(B(:,:,k+1),'CDataMapping','scaled')
%    colormap gray
%    colorbar;
%    
%    
% end





% %K=1; Warstwa 1:
% c = fspecial('gaussian', [x y], variance_center);
% s = fspecial('gaussian', [x y], variance_surround);
% DoG = c-s;
% %K=2; Warstwa 2:
% c_2 = fspecial('gaussian', [x/2 y/2], variance_center);
% s_2 = fspecial('gaussian', [x/2 y/2], variance_surround);
% DoG_2 = c_2 - s_2;
% b_2 = [DoG_2, DoG_2; DoG_2, DoG_2];


%Plot this sheeeit:
% figure(1)
% image(c,'CDataMapping','scaled')
% colormap gray
% colorbar;
% figure(2)
% image(s,'CDataMapping','scaled')
% colormap gray
% colorbar;
% figure(3)
% image(DoG,'CDataMapping','scaled')
% colormap gray
% colorbar;
% figure(4)
% image(b_2,'CDataMapping','scaled')
% colormap gray
% colorbar;
%Formula: .^ means each one of them
% for c = 1:x
%     for r = 1:y
%         z(r,c) = (1/(2*pi*variance))*exp(-((c^2 + r^2)/(2*variance)));
%     end
% end