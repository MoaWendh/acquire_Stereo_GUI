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
    
    % Abre uma caixa de diálogo solictando para fechar o preview:
    dlg= dialog('Position',[600 50 400 150],'Name','Preview estéreo');

    txt = uicontrol('Parent',dlg,'Style','text', 'Position',[20 60 400 40], 'String', 'Pressione "Fechar" para sair.', 'FontSize', 12);
     % txt.FontSize=12;          
    btn = uicontrol('Parent',dlg, 'Position',[160 20 70 25], 'String','Fechar',...
                    'Callback','delete(gcf)', 'FontSize', 12);
    
    % Aguardar ser pressionado o botão Fechar:
    uiwait(dlg);
    
    close all;
    
end
