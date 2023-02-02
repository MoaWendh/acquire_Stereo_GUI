%*************************************************************************
% Name: Moa
% Data: 13/02/2022
% Descrição: Função que lê os princiais parâmetros da câmera conectada ao 
% hardware.
%*************************************************************************

function fShowParamCam(handles)
     
    param= handles.paramCam;
    
    a= sprintf('                                            Camera 1              Camera 2  \n');
    b= sprintf('**************************************************************************  \n');    
    c= sprintf('Fabricante           :              %s                  %s\n', param(1).Fabricante, param(2).Fabricante);
    d= sprintf('Brightness             :              %3.2f                         %3.2f    \n', param(1).Brightness, param(2).Brightness);
    e= sprintf('Exposure               :              %3.2f                       %3.2f    \n', param(1).Exposure, param(2).Exposure);
    f= sprintf('ExposureMode      :              %s                      %s    \n', param(1).ExposureMode, param(2).ExposureMode);
    g= sprintf('FrameRate            :              %3.2f                         %3.2f    \n', param(1).FrameRate, param(2).FrameRate);
    h= sprintf('FrameRateMode   :              %s                      %s    \n', param(1).FrameRateMode, param(2).FrameRateMode);
    i= sprintf('Gain                      :              %3.2f                         %3.2f    \n', param(1).Gain, param(2).Gain);
    j= sprintf('GainMode             :              %s                      %s    \n', param(1).GainMode, param(2).GainMode);
    k= sprintf('Shutter                  :              %3.2f                      %3.2f \n', param(1).Shutter, param(2).Shutter);
    l= sprintf('ShutterMode         :              %s                      %s    \n', param(1).ShutterMode, param(2).ShutterMode);
    m= sprintf('TriggerDelay         :              %3.2f                         %3.2f    \n', param(1).TriggerDelay, param(2).TriggerDelay);
    n= sprintf('TriggerMode         :              %s                      %s    \n', param(1).TriggerDelayMode, param(2).TriggerDelayMode);
    o= sprintf('TriggerParameter :              %3.2f                         %3.2f    \n', param(1).TriggerParameter, param(2).TriggerParameter);

    msg= string([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o]);
    box1= msgbox(msg, 'Parâmetros das Câmeras' );
    box1.Position=[300,200,380,300];
    object_handles = findall(box1);
    set( object_handles(2), 'FontSize', 12, 'Position',[145 7 70 19]);
    set( object_handles(6), 'FontSize', 12);
      
end