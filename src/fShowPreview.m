function fshowPreview(handles)
   
    f1=figure;  
    f1.Name= 'Preview par estéreo';
    f1.WindowState='maximized';
    subplot(1,2,1);   
    title('Câmera Esquerda');
    hImageCam1= image(zeros(2048,2048));
    
    % Abre o preview da câmera 1:
    obj1 = videoinput("pointgrey",1);
    preview(obj1, hImageCam1); 

    subplot(1,2,2);   
    hImageCam2= image(zeros(2048,2048));
    
    % Abre o preview da câmera 2:
    obj2 = videoinput("pointgrey",2);
    preview(obj2, hImageCam2); 
    
    % Abre uma caixa de diálogo solictando para fechar o preview:
    dlg= dialog('Position',[600 50 400 150],'Name','Preview estéreo');

    txt = uicontrol('Parent',dlg,'Style','text', 'Position',[20 60 400 40], 'String', 'Pressione "Fechar" para sair do preview.', 'FontSize', 12);
     % txt.FontSize=12;          
    btn = uicontrol('Parent',dlg, 'Position',[160 20 70 25], 'String','Fechar',...
                    'Callback','delete(gcf)', 'FontSize', 12);
    
    % Aguardar ser pressionado o botão Fechar:
    uiwait(dlg);
              
    % Fecha o preview:
    stoppreview(obj1);
    stoppreview(obj2);
    delete(obj1);
    delete(obj2);
    close all;
end
