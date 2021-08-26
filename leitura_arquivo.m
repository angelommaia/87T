################################################################################
#                                                                              #
#                             SCRIPT FUNCAO 87T                                #
#                                                                              #
################################################################################

clear;home;
pkg load signal #para o resample 

#=======LEITURA INICIAL DE DADOS=======#
  
  #leitura arquivo .cfg #Nota: podem ser extraidos mais dados. avaliar
    nome_arquivo = "inrsh"; #apenas para salvar o nome do arquivo em variavel
    dados_cfg = fopen(strcat(nome_arquivo,".cfg"));
    foo = fgetl(dados_cfg); #para ignorar a linha de titulo, nao sera utilizada
    entradas = strsplit(fgetl(dados_cfg),','); #pegando a segunda linha,
                                                #que contem as qdes de entradas
  #tratando os dados
    
    # OBS: o comtrade 99 gerado pelo pscad possui espa�os antes do inicio dos dados 
  
    qde_entradas=str2double(entradas(1,1))(1) 
    entradas_analogicas= str2double(char(entradas(1,2)(1))(2))
    entradas_digitais=str2double(char(entradas(1,3)(1))(2))
   
  #verificacao da quantidade de amostras no arquivo .dat
     for i=1:qde_entradas
       teste=cell2mat(strsplit(fgetl(dados_cfg),',')(1,2));
       nome_variaveis{i} = teste(2:sizeof(teste)-4);
     end
     foo = fgetl(dados_cfg);foo = fgetl(dados_cfg); clear teste; clear i;
     
     entradas = strsplit(fgetl(dados_cfg),',');#linha com as entradas
     qde_amostras_cfg = str2double(char(entradas(1,2)))
     fclose(dados_cfg); 
     
    ##===leitura arquivo .dat===#
  
     #para testes, reduzir o tamanho do arquivo (leitura eh lenta)
      arquivo_dat = zeros(qde_amostras_cfg, qde_entradas+2); #alocacao
      printf('Lendo dados. Aguarde.\n'); 
      arquivo_dat = load (strcat(nome_arquivo,".dat")); #essa leitura demora bastante
      printf('Leitura realizada.\n');
     
      printf('O arquivo .dat possui %d amostras para cada sinal.\n',...
      size(arquivo_dat,1));
  
    #plotando dados originais para conferencia 
      plot(arquivo_dat(:,2)/10e5, arquivo_dat(:,3:5))
      legend(nome_variaveis{1},nome_variaveis{2},nome_variaveis{3}); #print ("-dpdf", 'plot.pdf');
      title (sprintf("Dados Originais do COMTRADE - Alta do Trafo"));
      xlabel('Tempo(s)');ylabel('Corrente(A)');
      figure();
      plot(arquivo_dat(:,2)/10e5, arquivo_dat(:,6:8))
      legend(nome_variaveis{4},nome_variaveis{5},nome_variaveis{6}); #print ("-dpdf", 'plot.pdf');
      title (sprintf("Dados Originais do COMTRADE - Baixa do Trafo"));
      xlabel('Tempo(s)');ylabel('Corrente(A)');
  
      
    ##=== interpola��o de dados ===#  fonte: https://stackoverflow.com/questions/33137018/resample-function-in-octave

##      fs = 1;
##      qde_amostras = (max(arquivo_dat(:,2))-min(arquivo_dat(1,2))*fs);
##      vet_samp = linspace(min(arquivo_dat(:,2)), max(arquivo_dat(:,2)), qde_amostras);
##      Yap = interp1(arquivo_dat(:,2),arquivo_dat(:,3:end), vet_samp );
##      plot(arquivo_dat(:,2),arquivo_dat(:,3:end))

     ## filttro passa baixa
##      n_filtro = 2; 
##      freq_corte = 300; 

     ## interpola��o numero de pontos por ciclo 
##      pontos_por_ciclo = 16;

     ## estima��o de fasores atrav�s do mmq
##

##======ALGORITMO DE PROTE��O======##

    ##===Correntes de restri��o e opera��o===#
    
    
    