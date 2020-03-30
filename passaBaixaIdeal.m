%Retorna uma sinc deslocada em M/2, representando o filtro passa baixa ideal
%universidade estadual de feira de santana 
%codigo criado por Gabriel Antonio Carneiro [gabri14el@gmail.com], baseado
%no tutorial de WR Kits
%[https://www.youtube.com/watch?v=cy9mTVYssiA&t=1673s]

%ultima modidicacao em 30/03/2019


function y = passaBaixaIdeal(wc, M)

alpha = (M-1)/2;
n = 0:(M-1);

m = n - alpha + eps;
y = sin(wc*m)./(pi*m);
end