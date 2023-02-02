%*************************************************************************
% Name: Moa
% Data: 11/02/2022
% Descrição: Efetua a leitura dos parâmetros gravados no arquivo.
% Caso o arquivo não exista, os parâmetros serão criados de forma genérica,
% posteriormente o arquivo deverá ser gerado com os parãmetros da cãmera,
% automático ou manualmente.
% Esta função retorna os parâmetros que estão gravados no arquivo "*.dat"
%*************************************************************************
function handles = fLerParametrosDoArquivo(handles)
    handles.numParams= 13;
    
    [handles.nameFileParam handles.pathFileParam]= uigetfile('\*.dat');
    fullPath= fullfile( handles.pathFileParam, handles.nameFileParam);    
    fileID=fopen(fullPath,'r');
    
    if (fileID==-1)
        strA= sprintf(' Erro ao abrir arquivo %s -> Código do erro = %d\n', handles.pathFileParam, fileID);
        strB= sprintf(' Possivelmente inexistente ou nome errado!!!!!');
        msg= string([strA strB]);
        msgBox(msg);
        
        % Criando uma struct com os parâmetros genéricos!!!
        handles.paramFile.Fabricante      = '???';
        handles.paramFile.Brightness      = -100;
        handles.paramFile.Exposure        = -100;
        handles.paramFile.ExposureMode    = '???';
        handles.paramFile.FrameRate       = -100;
        handles.paramFile.FrameRateMode   = '???';
        handles.paramFile.Gain            = -100;
        handles.paramFile.GainMode        = '???';
        handles.paramFile.Shutter         = -100;
        handles.paramFile.ShutterMode     = '???';
        handles.paramFile.TriggerDelay    = -100;
        handles.paramFile.TriggerDelayMode= '???';
        handles.paramFile.TriggerParameter= -100;
    else
        % linha{1}= regexp(fgetl(fileID),'\s','split');      
        % ctFinal= 14;
        ctParam=0;
        while 1 % Efetua a leitura do arquivo até fget() retornar o valor -1.
            ctParam= ctParam + 1;
            linhaAux= fgetl(fileID);
            if (linhaAux>0)
                linha{ctParam} = regexp(linhaAux,'\s','split');
            else
                if (ctParam== handles.numParams + 1)
                    msg3= sprintf('Ok!! Arquivo "%s" gravado com %d parâmetros.\n',handles.pathFileParam, handles.numParams);
                    disp(msg3); % Arquivo Ok!!!
                    handles.ArquivoParamLido= 1;
                    break;
                else 
                    strA= sprintf('Arquivo %s com número de parâmetros diferente de %d.\n',handles.pathFileParam, handles.numParams);
                    strB= sprintf('Verifique se o Arquivo %s está corrompido.\n',handles.pathFileParam);
                    strC= sprintf('Tente gravar novamente pelo mainMenu.\n');
                    msg= string([ strA strB strC]); % Arquivo com problemas!!!
                    msgBox(msg);
                    break;
                end
            end
        end 
        fclose(fileID); % Fecha o arquivo.
        
        % Criando uma struct com os parâmetros lidos do arquivo 'handles.paramFile.dat'.
        % Se o número de parâmetros for menor que numParam, os parametros receberão
        % valores genéricos. 
        
        if (ctParam==(handles.numParams + 1))     
            handles.paramFile.Fabricante      = linha{1}{2};
            handles.paramFile.Brightness      = round(str2double(linha{2}{2}),2);
            handles.paramFile.Exposure        = round(str2double(linha{3}{2}),2);
            handles.paramFile.ExposureMode    = linha{4}{2};
            handles.paramFile.FrameRate       = round(str2double(linha{5}{2}),2);
            handles.paramFile.FrameRateMode   = linha{6}{2};
            handles.paramFile.Gain            = round(str2double(linha{7}{2}),2);
            handles.paramFile.GainMode        = linha{8}{2};
            handles.paramFile.Shutter         = round(str2double(linha{9}{2}),2);
            handles.paramFile.ShutterMode     = linha{10}{2};
            handles.paramFile.TriggerDelay    = round(str2double(linha{11}{2}),2);
            handles.paramFile.TriggerDelayMode= linha{12}{2};
            handles.paramFile.TriggerParameter= str2num(linha{13}{2}); 
        else
             % Criando uma struct com os parâmetros genericos!!!
            handles.paramFile.Fabricante      = '???';
            handles.paramFile.Brightness      = -100;
            handles.paramFile.Exposure        = -100;
            handles.paramFile.ExposureMode    = '???';
            handles.paramFile.FrameRate       = -100;
            handles.paramFile.FrameRateMode   = '???';
            handles.paramFile.Gain            = -100;
            handles.paramFile.GainMode        = '???';
            handles.paramFile.Shutter         = -100;
            handles.paramFile.ShutterMode     = '???';
            handles.paramFile.TriggerDelay    = -100;
            handles.paramFile.TriggerDelayMode= '???';
            handles.paramFile.TriggerParameter= -100;       
        end             
    end  
end