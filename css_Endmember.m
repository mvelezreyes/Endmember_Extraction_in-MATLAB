function [E,IDX] = css (X, P)
%
% Endmember extraction using CSS based on
% Golub & Klema algorithm and QR with pivoting
%
%            E = css (X, p)
%
%  X  is the matrix of image pixels with
%      rows as bands and columns as pixels
%
%  p  is the number of endmembers
%
%  E  endmember signatures
 
[m,n]= size(X);
 
if (m>n)
[U, S, V] = svd(X,0);  % Thin matrix
elseif (m < n)
               [V, S, U] = svd (X',0); % Wide matrix
else
               [U, S, V] = svd(X,0); % Square matrix
end
 
%
% QR with pivoting to get the selected endmembers
% 
[q, r, pivots]=qr(V(:,1:P)',0);
 
% Select the endmembers
 
E = X(:, pivots(1:P));

IDX = pivots(1:P);
 
return