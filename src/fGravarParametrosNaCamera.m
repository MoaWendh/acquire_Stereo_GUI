function fGravarParametrosNaCamera(handles)
    
parametro= handles.paramFile;

for (i=1:length(handles.camObj))
    srcObj= getselectedsource(handles.camObj(i));
    % Gravando os parâmetros no dispositivo.
    if (srcObj.Brightness~=parametro.Brightness)
        disp(sprintf('Gravando parametro Brightness       = %d',parametro.Brightness));
        srcObj.Brightness= parametro.Brightness;
    end;    
    if (srcObj.Exposure~=parametro.Exposure)
        disp(sprintf('Gravando parametro Exposure         = %f',parametro.Exposure));
        srcObj.Exposure= parametro.Exposure;
    end;    
    if ~strcmp(srcObj.ExposureMode,parametro.ExposureMode)
        disp(sprintf('Gravando parametro ExposureMode     = %s',parametro.ExposureMode));
        srcObj.ExposureMode= parametro.ExposureMode;
    end;    
    if (srcObj.FrameRate~=parametro.FrameRate)
        disp(sprintf('Gravando parametro FrameRate        = %f',parametro.FrameRate));
        srcObj.FrameRate= parametro.FrameRate;
    end;    
    if ~strcmp(srcObj.FrameRateMode,parametro.FrameRateMode)
        disp(sprintf('Gravando parametro FrameRateMode    = %s',parametro.FrameRateMode));
        srcObj.FrameRateMode= parametro.FrameRateMode;
    end;    
    if (srcObj.Gain~=parametro.Gain)
        disp(sprintf('Gravando parametro Gain             = %f',parametro.Gain));
        srcObj.Gain= parametro.Gain;
    end;
    if ~strcmp(srcObj.GainMode,parametro.GainMode)
        disp(sprintf('Gravando parametro GainMode         = %s',parametro.GainMode));
        srcObj.GainMode= parametro.GainMode;
    end;
    if (srcObj.Shutter~=parametro.Shutter)
        disp(sprintf('Gravando parametro Shutter          = %f',parametro.Shutter));
        srcObj.Shutter= parametro.Shutter;
    end;    
    if ~strcmp(srcObj.ShutterMode,parametro.ShutterMode)
        disp(sprintf('Gravando parametro ShutterMode      = %s',parametro.ShutterMode));
        srcObj.ShutterMode= parametro.ShutterMode;
    end;    
    if (srcObj.TriggerDelay~=parametro.TriggerDelay)
        disp(sprintf('Gravando parametro TriggerDelay     = %f',parametro.TriggerDelay));
        srcObj.TriggerDelay= parametro.TriggerDelay;
    end;
    if ~strcmp(srcObj.TriggerDelayMode,parametro.TriggerDelayMode)
        disp(sprintf('Gravando parametro TriggerDelayMode = %s',parametro.TriggerDelayMode));
        srcObj.TriggerDelayMode= parametro.TriggerDelayMode;
    end;  
    if (srcObj.TriggerParameter~=parametro.TriggerParameter)
        disp(sprintf('Gravando parametro TriggerParameter = %f',parametro.TriggerParameter));
        srcObj.TriggerParameter= parametro.TriggerParameter;
    end;    
end
end