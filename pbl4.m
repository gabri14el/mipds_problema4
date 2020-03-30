%==================================
%           Bloco de Gravacao
fsample = 11025;                         
tr = 2;                        
recObj = audiorecorder(fsample,8,1); 
disp('Gravando.')
recordblocking(recObj, tr);
disp('Terminou de Gravar.');
dataIn = getaudiodata(recObj);
sinal = getaudiodata(recObj);

%==================================
%           Filtro

fp = 300; %passagem
fs = 550; %stop
%------------- 
%normalizacao das frequencias
%-------------
w = 2*pi/fsample; %fator comum em todas as matrizes para normalizacao das frequencias
wp = fp*w; %banda de passagem
ws = fs*w; %banda de rejeicao


wc = (wp+ws)/2; %frequencia de corte
wt = ws - wp; %frequencia de transicao

%==================================
%           janela de hamming

%comprimento da janela a partir de equacao tabelada



%janelas
M1 = defineTamanho('hann', wt);
disp(sprintf("o tamanho da janela de hann é: %d", M1));
j_hann = filtroHann(M1);
M2 = defineTamanho('retangular', wt);
disp(sprintf("o tamanho da janela de retangular é: %d", M2));
j_retang = filtroRetangular(M2);
M3 = defineTamanho('triangular', wt);
disp(sprintf("o tamanho da janela de triangular é: %d", M3));
j_triang = filtroTriangular(M3);


%criando os filtros janelados
filtroJaneladoHann = passaBaixaIdeal(wc, M1).*j_hann;
filtroJaneladoRetang = passaBaixaIdeal(wc, M2).*j_retang;
filtroJaneladoTriang = passaBaixaIdeal(wc, M3).*j_triang;

%exibicao do espectro da frequencia dos filtros
wvtool(passaBaixaIdeal(wc, M1), filtroJaneladoHann);
wvtool(passaBaixaIdeal(wc, M3), filtroJaneladoTriang);
wvtool(passaBaixaIdeal(wc, M2), filtroJaneladoRetang);



%==================================
%           filtragem do sinal

sinalFilt = conv(sinal, passaBaixaIdeal(wc, M3));
sinalFilt_hann = conv(sinal, filtroJaneladoHann);
sinalFilt_retang = conv(sinal, filtroJaneladoRetang);
sinalFilt_triang = conv(sinal, filtroJaneladoTriang);

%plotagem dos sinais
figure();
hold on;
plot(sinal, '--b');
plot(sinalFilt_hann, '--r');
title('Janela de Hann');
hold off;
plotFFT(sinalFilt_hann, fsample, 'Janela Hann');

figure();
hold on;
plot(sinal, '--b');
plot(sinalFilt_retang, '--r');
title('Janela Retangular');
hold off;
plotFFT(sinalFilt_retang, fsample, 'Janela Retangular');

figure();
hold on;
plot(sinal, '--b');
plot(sinalFilt_triang, '--r');
title('Janela Triangular');
hold off;
plotFFT(sinalFilt_triang, fsample, 'Janela Triangular');

figure();
hold on;
plot(sinal, '--b');
plot(sinalFilt, '--r');
title('Filtro Ideal');
hold off;
plotFFT(sinalFilt, fsample, 'Filtro Ideal');

plotFFT(sinal, fsample, 'Sinal não filtrado');
%==================================
%           play

disp('reproduzindo audio nao filtrado');
play(recObj);
disp('reproduzindo audio filtrado');
player = audioplayer(sinalFilt_hann,fsample, 8);
play(player);

