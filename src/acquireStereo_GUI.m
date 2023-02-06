function varargout = acquireStereo_GUI(varargin)
% ACQUIRESTEREO_GUI MATLAB code for acquireStereo_GUI.fig
%      ACQUIRESTEREO_GUI, by itself, creates a new ACQUIRESTEREO_GUI or raises the existing
%      singleton*.
%
%      H = ACQUIRESTEREO_GUI returns the handle to a new ACQUIRESTEREO_GUI or the handle to
%      the existing singleton*.
%
%      ACQUIRESTEREO_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ACQUIRESTEREO_GUI.M with the given input arguments.
%
%      ACQUIRESTEREO_GUI('Property','Value',...) creates a new ACQUIRESTEREO_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before acquireStereo_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to acquireStereo_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help acquireStereo_GUI

% Last Modified by GUIDE v2.5 06-Feb-2023 17:16:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @acquireStereo_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @acquireStereo_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before acquireStereo_GUI is made visible.
function acquireStereo_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to acquireStereo_GUI (see 

%************ Parâmetros do usuário abaixo ********************************

% Parâmetro, flag, que indica que o arqquivo de dados foi carregado para a
% memória, possibilitando alterar os parãmetros das câmeras:
handles.ArquivoParamLido= 0;
handles.camObjStarted= 0;
handles.camObj(1).DeviceID= 0;
handles.ctCapture= 0;
handles.pathsDefinidos= 0;
handles.camerasConfiguradas= 0;
handles.extImageFile= '.png';

%************ Parâmetros do usuário acima *********************************

% Choose default command line output for acquireStereo_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes acquireStereo_GUI wait for user response (see UIRESUME)
% uiwait(handles.figureBase);

% --- Outputs from this function are returned to the command line.
function varargout = acquireStereo_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbAbrirAsCameras.
function pbAbrirAsCameras_Callback(hObject, eventdata, handles)
% hObject    handle to pbAbrirAsCameras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Antes de ler os parâmetros da câmera tem que ser criado um objeto para o
% device câmera.
% Abre e cria um objeto para acessar as câmeras:
[handles.camObj handles.paramCamHW]= fOpenCam();

if (handles.camObj(1).DeviceID)
    if (handles.ArquivoParamLido && handles.camerasConfiguradas && handles.pathsDefinidos)
        handles.pbCapturaImagens.Enable= 'on';
    else
        handles.pbCapturaImagens.Enable= 'off';        
    end
    
    handles.camObjStarted= 1;
    msg= sprintf('Foram criados %d objetos para os devices:\n - Câmera: %s\n - Câmera: %s', ...
                length(handles.camObj), handles.paramCamHW(1).deviceModel, handles.paramCamHW(2).deviceModel);
    handles.editMsgs.String= msg;
    
    handles.staticStatusCamerasOpen.ForegroundColor= [0.5, 0.7, 0.2];
    handles.staticStatusCamerasOpen.String= 'Câmeras ok';
    
    handles.pbShowParamCams.Enable= 'on';
    handles.pbTesteCapturaImages.Enable= 'on';

    handles.pbFechaCameras.Enable= 'on';
    
    handles.pbPreviewParEstereo.Enable= 'on';    
else
    handles.staticStatusCamerasOpen.ForegroundColor= [1.0, 0.0, 0.0];
    handles.staticStatusCamerasOpen.String= 'Câmeras fechadas';
    
    handles.pbShowParamCams.Enable= 'off';
    handles.pbTesteCapturaImages.Enable= 'off';
    
    handles.pbFechaCameras.Enable= 'off';
    
    handles.pbPreviewParEstereo.Enable= 'on';
end
    
% Efetua a leitura dos parãmetros das câmeras:
handles= fLerParametrosDaCamera(handles); 

% Update handles structure
guidata(hObject, handles);


function editMsg_Callback(hObject, eventdata, handles)
% hObject    handle to editMsgs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMsgs as text
%        str2double(get(hObject,'String')) returns contents of editMsgs as a double


% --- Executes during object creation, after setting all properties.
function editMsgs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMsgs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pbLerParamFiles.
function pbLerParamFiles_Callback(hObject, eventdata, handles)
% hObject    handle to pbLerParamFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%param.numFiles= 1001;

% Faz a leitura dos parâmetros previamente armazenados num arquivo de
% dados, Este arquivo pé usado para coonfigurar as cãmeras com os
% parâmetros desejados no ensaio:
handles= fLerParametrosDoArquivo(handles);

if (handles.ArquivoParamLido) 
    
    if (handles.camObj(1).DeviceID && handles.camerasConfiguradas && handles.pathsDefinidos)
        handles.pbCapturaImagens.Enable= 'on';
    else
        handles.pbCapturaImagens.Enable= 'off';        
    end
    
    msg= sprintf('Ok! Parâmetros lidos do arquivo.');
    handles.editMsgs.String= msg;
        
    handles.staticStatusArqLido.ForegroundColor= [0.5, 0.7, 0.2];
    handles.staticStatusArqLido.String= 'Arquivo lido';

    handles.pbExibeParamFiles.Enable= 'on';
    
    % Exibe os prâmetros lidos do arquivo de dados:
    fShowParamFile(handles);

else
    msg= sprintf(' Problemas ao ler arquivos de parâmetros.\n Verifique se o arquivo não está corrompido!');
    msgbox(msg, 'Atenção!', 'warn');
    
    handles.staticStatusArqLido.ForegroundColor= [1.0, 0.0, 0.0];
    handles.staticStatusArqLido.String= 'Arquivo não lido';
    
    handles.pbExibeParamFiles.Enable= 'off';
end

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pbShowParamCams.
function pbShowParamCams_Callback(hObject, eventdata, handles)
% hObject    handle to pbShowParamCams (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (handles.camObjStarted)
    fShowParamCam(handles);
else
    msg= sprintf(' As câmeras não foram abertas ainda.\n Primeiro crie os objetos das câmeras.!');
    msgbox(msg, 'Atenção!', 'warn')    
end

% --- Executes on button press in pbExibeParamFiles.
function pbExibeParamFiles_Callback(hObject, eventdata, handles)
% hObject    handle to pbExibeParamFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.ArquivoParamLido 
    msg= sprintf('Ok! Parâmetros lidos do arquivo.');
    handles.editMsgs.String= msg;
    
    % Exibe os prâmetros lidos do arquivo de dados:
    fShowParamFile(handles);
else
    msg= sprintf(' Os dados do arquivo não estão carregados na memória.\n Primeiro carregue o arquivo.');
    msgbox(msg, 'Atenção!', 'warn');
end


% --- Executes on button press in pbConfigCams.
function pbConfigCams_Callback(hObject, eventdata, handles)
% hObject    handle to pbConfigCams (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Chama função para gravar os parãmetros do arquivo na câmera:
if (handles.ArquivoParamLido)       
    handles= fGravarParametrosNaCamera(handles);
    
    msg= sprintf('Parâmetros gravados nas câmeras.');
    handles.editMsgs.String= msg;
    
    handles.staticStatusCamerasConfig.ForegroundColor= [0.5, 0.7, 0.2];
    handles.staticStatusCamerasConfig.String= 'Câmeras configuradas';
    
    if (handles.camObj(1).DeviceID && handles.camerasConfiguradas && handles.pathsDefinidos)
        handles.pbCapturaImagens.Enable= 'on';
    else
        handles.pbCapturaImagens.Enable= 'off';        
    end  
else
    handles.camerasConfiguradas= '0';
    msg= sprintf('Primeiro carregue os arquivos de dados. ');
    msgbox(msg, 'Atenção!', 'warn');
    
    handles.staticStatusCamerasConfig.ForegroundColor= [1, 0.0, 0.0];
    handles.staticStatusCamerasConfig.String= 'Câmeras não configuradas';
end

% Efetua a leitura dos parãmetros das câmeras:
handles= fLerParametrosDaCamera(handles); 

% Exibe os parâmetros da câmera; 
fShowParamCam(handles);

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pbTesteCapturaImages.
function pbTesteCapturaImages_Callback(hObject, eventdata, handles)
% hObject    handle to pbTesteCapturaImages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Verica se a aquisição das câmeras está ok. 
if (handles.camObjStarted)
    fShowSnapShot(handles);
    msg= sprintf(' Imagens capturadas.\n Verifique a qualidade.');
    handles.editMsgs.String= msg;    
else
    msg= sprintf(' As câmeras não foram abertas ainda.\n Primeiro crie os objetos das câmeras.!');
    msgbox(msg, 'Atenção!', 'warn')    
end

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pbPreviewParEstereo.
function pbPreviewParEstereo_Callback(hObject, eventdata, handles)
% hObject    handle to pbPreviewParEstereo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Abre um stream das duas câmeras. 
fShowPreview(handles);



% --- Executes on button press in pbClose.
function pbClose_Callback(hObject, eventdata, handles)
% hObject    handle to pbClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (handles.camObjStarted)
    if (handles.camObj(1).DeviceID || handles.camObj(2).DeviceID)
        % Fecha o hardware e reseta todas as variáveis:
        imaqreset; % Fecha todos os devices de aquisição de imagem
        delete(handles.camObj(1)); % Deleta o objeto aberto.
        delete(handles.camObj(2)); % Deleta o objeto aberto.
    end
end

% Fecha o programa:
handles.figureBase.HandleVisibility= 'on';
clc;
clear;
close all;


% --- Executes on button press in pbGeraPathToSaveImages.
function pbGeraPathToSaveImages_Callback(hObject, eventdata, handles)
% hObject    handle to pbGeraPathToSaveImages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles= fGeraPaths(handles);

if (handles.pathsDefinidos)
    handles.staticStatusPaths.ForegroundColor= [0.5, 0.7, 0.2];
    handles.staticStatusPaths.String= 'Paths definidos';

    if (handles.camObj(1).DeviceID && handles.camerasConfiguradas && handles.ArquivoParamLido )
        handles.pbCapturaImagens.Enable= 'on';
    else
        handles.pbCapturaImagens.Enable= 'off';        
    end 
    
else
    handles.staticStatusPaths.ForegroundColor= [1, 0.0, 0.0];
    handles.staticStatusPaths.String= 'Paths não definidos'; 
end

% Aqui também tem que ser zerado o contador de imagens capturadas e salvas:
handles.ctCapture= 0;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pbCapturaImagens.
function pbCapturaImagens_Callback(hObject, eventdata, handles)
% hObject    handle to pbCapturaImagens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Só serão capturadas e salvas imagens se os folders foram craidos e se
% as câmeras foram inicializadas:
if (handles.pathsDefinidos)
    if (handles.camObjStarted)
        handles= fSalvaImagem(handles);
    else
        msg= sprintf(' As câmeras não foram abertas ainda.\n Primeiro crie os objetos das câmeras.!');
        msgbox(msg, 'Atenção!', 'warn') 
    end
else
    msg= sprintf(' Primeiro crie os paths onde serão salvas as imagens L e R.');
    msgbox(msg, 'Atenção!', 'warn')        
end

% Imprime as imagens salvas: 
handles.editMsgs.String= handles.msg;

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function pbAbrirAsCameras_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pbAbrirAsCameras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pbFechaCameras.
function pbFechaCameras_Callback(hObject, eventdata, handles)
% hObject    handle to pbFechaCameras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Fechas os HWs das câmeras
if (handles.camObj(1).DeviceID || handles.camObj(2).DeviceID)
    % Fecha o hardware e reseta todas as variáveis:
    imaqreset; % Fecha todos os devices de aquisição de imagem
    delete(handles.camObj(1)); % Deleta o objeto aberto.
    delete(handles.camObj(2)); % Deleta o objeto aberto.
    
    handles.staticStatusCamerasOpen.ForegroundColor= [1.0, 0.0, 0.0];
    handles.staticStatusCamerasOpen.String= 'Câmeras fechadas';
    handles.editMsgs.String= 'Câmeras fechadas';
    handles.camObjStarted= 0;
end

% Update handles structure
guidata(hObject, handles);
