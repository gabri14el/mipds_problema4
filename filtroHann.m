%universidade estadual de feira de santana 
%codigo criado por Gabriel Antonio Carneiro [gabri14el@gmail.com]
%ultima modidicacao em 30/03/2019
%codigo retorna uma janela de hann de tamanho L
function y = filtroHann(L)
    aux = 0:(L-1);
    y = 0.5.*(1 - cos(2*pi.*(aux/(L-1))));
end