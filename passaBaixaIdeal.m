% Retorna uma sinc representando o filtro passa baixa ideal
% 
%

function y = passaBaixaIdeal(wc, M)

alpha = (M-1)/2;
n = 0:(M-1);

m = n - alpha + eps;
y = sin(wc*m)./(pi*m);
end