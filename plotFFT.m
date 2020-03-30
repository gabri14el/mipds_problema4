function [y] = fft_dt(x,fs, title_text)

x_bak = x;
y = fft(x);
N=length(x);                                                          
aux = 0:N-1;
T = N/fs;
frequency = (aux/T);
%frequency = fs*(aux)/N;
yn = y;

fc = ceil(fs/2);

yn = yn(1:fc);

figure();
subplot(311);
stem(x_bak);
title(title_text);
ylabel('Amplitude');
xlabel('Tempo');


subplot(312);
plot(frequency(1:fc),abs(yn));
title('Espectro na Frequência');
ylabel('Módulo');
xlabel('Frequência');

subplot(313);
plot(frequency(1:fc),angle(yn));
ylabel('Fase');
xlabel('Frequência');

end