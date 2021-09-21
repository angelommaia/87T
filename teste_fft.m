clear;home; 
 ##===COMPONENTES HARMONICAS===##
      freq_sampl = 1/(2^16);
      intervalo_tempo = (0:freq_sampl:(1/60))';
      sinal_teste = sin(2*pi()*60*intervalo_tempo);
      
      plot(intervalo_tempo, sinal_teste)
      
      freq_samp = mean(diff(intervalo_tempo)); ##calculada com o intervalo de tempo utilizado
      transformada_fourier = abs(fft(sinal_teste)/size(sinal_teste,1));
      frequencias = (0:(size(intervalo_tempo,1)-1))/length(size(intervalo_tempo,1));
      figure()

      bar(frequencias/60, transformada_fourier/max(transformada_fourier)*100);
      title('Harmonicas');
      xlabel('Ordem')
      ylabel('Amplitue (%)')
      xlim([0 9]);
      grid on;

      frequencia_de_amostragem = 1000;
      Nyquist = frequencia_de_amostragem / 2;
      
      fourier = abs(fft(sinal_teste)/length(sinal_teste));
      fourier_parametrizada = fourier/max(fourier)*100;
      figure()
      bar((0:length(sinal_teste)-1)*frequencia_de_amostragem/length(sinal_teste), fourier_parametrizada);
      xlim([0 9]);
      
ORI(:,3)=sinal_teste;
      delta_t = 0.0001;
      fs=1/delta_t; % Freqüência de amostragem
      fnyq=fs/2;
      N=length(ORI(:,3)); % Determina o número de amostras
      F=fft(ORI(:,3)); % Calcula a DFT
      Fesc=F/N; % Escalona para o valor correto
      a=0:(N-1)
      freq=((a)*fs)/N; % Calcula eixo das freqüências
      Fparam = abs(F)
      Maior=max(Fparam);
      Fparam=(Fparam/Maior)*100
      ordem=freq/60;
      figure(9)
      bar(ordem,Fparam)
      title('Análise dos harmônicos','fontweight','bold','fontsize',12 );
      xlabel('Ordem') % Label do eixo x
      ylabel('Amplitue (%)') % Label do eixo y
      xlim([0 7]);
      grid on