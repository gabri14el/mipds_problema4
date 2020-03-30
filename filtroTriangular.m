%universidade estadual de feira de santana 
%codigo criado por Gabriel Antonio Carneiro [gabri14el@gmail.com]
%ultima modidicacao em 30/03/2019
%codigo retorna uma janela triangular de tamanho M

function y =  filtroTriangular(M)
resto = mod(M, 2);

if resto ~= 0
    aux = 1:((M+1)/2);
    aux = (2.*aux)/(M+1);
    
    aux2 = (((M+1)/2)+1):M;
    aux2 = (2 - ((2.*aux2)/(M+1)));
    
    y = [aux aux2];
else
    aux = 1:(M/2);
    aux = (2.*aux - 1)/M;
    
    aux2 = ((M/2)+1):M;
    aux2 = (2 - ((2.*aux2)-1)/M);
    
    y = [aux aux2];
end

end