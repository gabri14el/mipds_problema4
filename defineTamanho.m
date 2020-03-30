function M = defineTamanho(tipo, wt)

if strcmp('hann', tipo)
    %M = ceil(8*pi/wt);
    A = 44;
elseif  strcmp('retangular', tipo)
    %M = ceil(4*pi/wt) - 1;
    A = 21;
elseif strcmp('triangular', tipo)
    %M = ceil(4*pi/wt) - 1;
    A = 25;
end

M = ceil((A - 8)/(2.285*wt));
end