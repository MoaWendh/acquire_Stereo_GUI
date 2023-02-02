%*************************************************************************
% Name: Moa
% Data: 13/02/2022
% Descrição: Função que lê os princiais parâmetros da câmera conectada ao 
% hardware.
%*************************************************************************

function fShowParamFile(handles)
     
    param= handles.paramFile;
    
    a= sprintf('                      Parâmetros do arquivo de dados:\n' );
    b= sprintf('********************************************************* \n'); 
    c= sprintf('Fabricante             :              %s                  \n', param.Fabricante);
    d= sprintf('Brightness             :              %3.2f             \n', param.Brightness);
    e= sprintf('Exposure               :              %3.2f             \n', param.Exposure);
    f= sprintf('ExposureMode      :              %s                     \n', param.ExposureMode);
    g= sprintf('FrameRate            :              %3.2f               \n', param.FrameRate);
    h= sprintf('FrameRateMode   :              %s                       \n', param.FrameRateMode);
    i= sprintf('Gain                      :              %3.2f          \n', param.Gain);
    j= sprintf('GainMode             :              %s                  \n', param.GainMode);
    k= sprintf('Shutter                  :              %3.2f           \n', param.Shutter);
    l= sprintf('ShutterMode         :              %s                   \n', param.ShutterMode);
    m= sprintf('TriggerDelay         :              %3.2f               \n', param.TriggerDelay);
    n= sprintf('TriggerMode         :              %s                   \n', param.TriggerDelayMode);
    o= sprintf('TriggerParameter :              %3.2f                   \n', param.TriggerParameter);

    msg= string([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o]);
    box1= msgbox(msg);
    box1.Position=[300,200,320,300];
    object_handles = findall(box1);
    set( object_handles(2), 'FontSize', 12, 'Position',[145 7 60.0000 19]);
    set( object_handles(6), 'FontSize', 12);
      
end