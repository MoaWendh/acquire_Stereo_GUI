function fshowSnapShot(handles)

    imageL= getsnapshot(handles.camObj(1));
    imageR= getsnapshot(handles.camObj(2));
    
    f=figure;
    f.Name= 'Preview do para estéreo';
    f.WindowState='maximized';
    
    subplot(1,2,1);   
    imshow(imageL); 
    title('Câmera Esquerda')
    subplot(1,2,2);   
    imshow(imageR);
    title('Câmera Direita')
end
