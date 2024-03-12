% Función de control para inyectar una fuerza "u" para mover
% el cabezal sobre el riel en una impresora 3D
% xref: posición de referencia para el cabezal
% x   : posición actual del cabezal
% v   : velocidad del cabezal
% h   : tiempo transcurrido desde la última vez que se actualizó el control
function u = controller( xref, x, v, h )
    
    % Ejemplo de control incorrecto (inestable)
    if x>xref
       u = -1;
    else
       u = 1;
    end

end
