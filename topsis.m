clear;clc
load gongsi.mat
load weight.mat
[n,m] = size(X);
Position = [1:16,28:38];
Type = ones(1,27);
for i = 1 : size(Position,2)  
    X(:,Position(i)) = Positivization(X(:,Position(i)),Type(i),Position(i));
end
Z = X ./ repmat(sum(X.*X) .^ 0.5, n, 1);
D_P = sum([(Z - repmat(max(Z),n,1)) .^ 2 ] .* repmat(weight,n,1) ,2) .^ 0.5;   
D_N = sum([(Z - repmat(min(Z),n,1)) .^ 2 ] .* repmat(weight,n,1) ,2) .^ 0.5;  
S = D_N ./ (D_P+D_N);
disp('Final score ')
stand_S = S(1,1)*400 
[sorted_S,index] = sort(stand_S ,'descend');

weight_e=weight(1:14,1);
Z_e=Z(1,1:14);
if Z_e == zeros(1,14);
    Z_e=rand(1,14);
end
D_Pe = sum([(Z_e - repmat(max(Z_e),n,1)) .^ 2 ] .* repmat(weight_e,n,1) ,2) .^ 0.5;  
D_Ne = sum([(Z_e - repmat(min(Z_e),n,1)) .^ 2 ] .* repmat(weight_e,n,1) ,2) .^ 0.5;  
S_e = D_Ne ./ (D_Pe+D_Ne);   
disp('Environmental score')
stand_Se = S_e(1,1)*150
[sorted_Se,index] = sort(stand_Se ,'descend');

weight_s=weight(15:50,1);
Z_s=Z(1,15:50);
if Z_s == zeros(1,36);
    Z_s=rand(1,36);
end
D_Ps = sum([(Z_s - repmat(max(Z_s),n,1)) .^ 2 ] .* repmat(weight_s,n,1) ,2) .^ 0.5;   
D_Ns = sum([(Z_s - repmat(min(Z_s),n,1)) .^ 2 ] .* repmat(weight_s,n,1) ,2) .^ 0.5;  
S_s = D_Ns ./ (D_Ps+D_Ns);   
disp('Social score')
stand_Ss = S_s(1,1)*340
[sorted_Ss,index] = sort(stand_Ss ,'descend');

weight_g=weight(51:56,1);
Z_g=Z(1,51:56);
if Z_g == zeros(1,6);
    Z_g=rand(1,6);
end
D_Pg = sum([(Z_g - repmat(max(Z_g),n,1)) .^ 2 ] .* repmat(weight_g,n,1) ,2) .^ 0.5;  
D_Ng = sum([(Z_g - repmat(min(Z_g),n,1)) .^ 2 ] .* repmat(weight_g,n,1) ,2) .^ 0.5;   
S_g = D_Ng ./ (D_Pg+D_Ng);  
disp('Governance score')
stand_Sg = S_g(1,1)*150
[sorted_Sg,index] = sort(stand_Sg ,'descend');
