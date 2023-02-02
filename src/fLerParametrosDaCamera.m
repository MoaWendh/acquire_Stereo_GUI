%*************************************************************************
% Name: Moa
% Data: 13/02/2022
% Descrição: Função que lê os princiais parâmetros da câmera conectada ao 
% hardware.
%*************************************************************************

function handles = fLerParametrosDaCamera(handles)
    clc;  
    for (i=1:length(handles.paramCamHW))    
       % Carrega os principais paretros da câmera na variável srcobj:
        param(i)= handles.paramCamHW(i);
        srcobj(i) = getselectedsource(handles.camObj(i));  

       % Seleciona os principais parêmtros a serem guardados em uma cell,
       % que estão na struct srcobj:
        handles.paramCam(i).Fabricante      = param(i).deviceName;
        handles.paramCam(i).Brightness      = round(srcobj(i).Brightness,3);
        handles.paramCam(i).Exposure        = round(srcobj(i).Exposure,3);
        handles.paramCam(i).ExposureMode    = srcobj(i).ExposureMode;
        handles.paramCam(i).FrameRate       = round(srcobj(i).FrameRate,3);
        handles.paramCam(i).FrameRateMode   = srcobj(i).FrameRateMode;
        handles.paramCam(i).Gain            = round(srcobj(i).Gain,3);
        handles.paramCam(i).GainMode        = srcobj(i).GainMode;
        handles.paramCam(i).Shutter         = round(srcobj(i).Shutter,3);
        handles.paramCam(i).ShutterMode     = srcobj(i).ShutterMode;
        handles.paramCam(i).TriggerDelay    = round(srcobj(i).TriggerDelay,3);
        handles.paramCam(i).TriggerDelayMode= srcobj(i).TriggerDelayMode;
        handles.paramCam(i).TriggerParameter= srcobj(i).TriggerParameter; 
    end
end