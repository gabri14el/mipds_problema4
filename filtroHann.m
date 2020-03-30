function y = filtroHann(L)
    aux = 0:(L-1);
    y = 0.5.*(1 - cos(2*pi.*(aux/(L-1))));
end