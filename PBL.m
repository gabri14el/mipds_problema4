%----------Setup-----------%
Fs= 8000;%Sample Rate (Frequ�ncia de Amostragem)
fs = Fs;
fc = 500;%Frequ�ncia de Corte to Filtro Passa Baixa
tr = 2;%Tempo de Grava��o
L = Fs;
t = 0:1/Fs:tr-1/Fs; % Intervalo de tempo da Janela de Hanning
f = Fs/2*linspace(0,1,L/2+1);
recObj = audiorecorder; %Objeto para capturar o Audio
h = (1-cos(2*pi*t))/2;%Fun��o de Hann para o intervalo t

%----------Captura do Som-----------%
disp('Gravando.')
recordblocking(recObj, tr);
disp('Terminou de Gravar.');
dataIn = getaudiodata(recObj);

%----------Filtro Passa Baixa-----------%
[b,a] = butter(6,fc/(fs/2));
y = filter(b,a,dataIn);

%----------Janelamento-----------%
figure
plot(Fs*t,y,'b',Fs*t,h.'.*y,'g')
title('Janelamento do Sinal no tempo');



Y = fft(y,L)/L;     % Signal transform
H = fft(h,L)/L;     % Hann transform
Yc= fft(y.*h.',L)/L;  % Time windowed signal transform
YC= conv(Y,H);      % Frequency windowed signal transform

mag=20*log10(abs(Yc));