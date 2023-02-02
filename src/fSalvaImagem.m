%*************************************************************************
% Name: Moa
% Data: 16/02/2022
% Descrição: 
%*************************************************************************

function handles= fSalvaImagem(handles)

% Incrementa o contador de captura e salvamento de imagem:
ct= handles.ctCapture + 1;

% tempoFinalEnsaio= datestr(now,'HH:MM:SS.FFF');

for (i=1:length(handles.camObj))
    % i=1 indica a câmera esquerda "L":
    if (i==1)
        % Define o path geral e nome do arquivo a ser salvo:
        nameFile= sprintf('%0.4d%s', ct, handles.extImageFile);
        fullPath= fullfile(handles.param.pathToSaveImagesL, nameFile);
        fullPathL= fullPath;
    else
        % Define o path geral e nome do arquivo a ser salvo:
        nameFile= sprintf('%0.4d%s', ct, handles.extImageFile);
        fullPath= fullfile(handles.param.pathToSaveImagesR, nameFile);           
        fullPathR= fullPath;
    end
    % Captura imagem:
    imageCap= getsnapshot(handles.camObj(i));
    % Salva a imagem:
    imwrite(imageCap, fullPath);   
    fprintf('Imagem %s salva em: %s: \n', nameFile, fullPath);   
    fprintf('\n');
end

handles.msg= sprintf(' Foram salvas as PCs:\n - %s\n - %s', fullPathL, fullPathR);

% Atualiza o contador de imagens salvas:
handles.ctCapture= ct;
end