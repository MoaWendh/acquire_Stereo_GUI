function handles= fLerTemperaturaDaCamera(handles)
    for (ct=1:length(camObj))
        offsetTemp = 273.15;
        srcObj(ct)= getselectedsource(handles.camObj(ct));
        
        if (ct==1)
            handles.TempL= round((handles.srcObj(ct).Temperature -offsetTemp), 4);
        else
            handles.TempR= round((handles.srcObj(ct).Temperature -offsetTemp), 4);
        end
    end
end

