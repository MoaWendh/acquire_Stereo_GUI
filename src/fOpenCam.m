function [cameraObj paraCamHW]= fOpenCam()

    % Resetar o HW antes de carregar, pois pode estar travado.
    imaqreset;
    % Abrir o hardware para verificar os devices disponíveis.
    % hwinfo é uma struct que contém todas propriedades do hardware.
    % Carrega as informações de hardware:
    hwInfo = imaqhwinfo;
    % Guarda o número de devices detectados:
    dInfo= imaqhwinfo(cell2mat(hwInfo.InstalledAdaptors));
    numDevs= length(dInfo.DeviceIDs);
    
    % Carrega as informações de um device específico
    for (i=1:numDevs)
        devInfo(i)= imaqhwinfo(cell2mat(hwInfo.InstalledAdaptors),i);
        % Cria um objeto para cada device:
        camObj(i)= videoinput(hwInfo.InstalledAdaptors{1},i);
        % Carrega os princiáis parâmetros do device:
        srcObj(i)= getselectedsource(camObj(i));
        % Gera uma struct com os principais parâmetros do HW da camera:
        parametroCamHW(i).deviceName= hwInfo.InstalledAdaptors{1};
        parametroCamHW(i).deviceModel= devInfo(i).DeviceName;
        parametroCamHW(i).camID= devInfo(i).DeviceID;
        parametroCamHW(i).deviceSerialNumber = srcObj(i).SerialNumber;
    end       
    cameraObj= camObj;
    paraCamHW= parametroCamHW;
end