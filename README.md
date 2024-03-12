# Simulación en MATLAB del control de posición de un cabezal extrusor para impresión 3D

## Descripción

Este proyecto proporciona un entorno de simulación en MATLAB para un cabezal extrusor de una impresora 3D, el cual se desplaza unidireccionalmente a lo largo de un riel. Este sistema simula el proceso de posicionamiento preciso necesario para depositar material fundido en ubicaciones específicas, un componente esencial en la impresión 3D. Aunque típicamente una impresora 3D utiliza tres rieles para permitir movimientos tridimensionales, este modelo se ha simplificado a un solo riel para facilitar su comprensión y análisis.

El cabezal, que está equipado con un motor, se mueve a lo largo del riel, mientras que un sensor monitorea constantemente la posición del extrusor. El principal desafío radica en determinar cómo ajustar el control para que el extrusor alcance una posición objetivo.

## Instrucciones

### Modificación del Controlador

Para modificar el controlador, escriba o modifique el contenido dentro del archivo `controller.m`.

### Ejecución de la Simulación

Para ejecutar la simulación, ejecute el archivo `printer3d_sim.m`.

### Ejemplo de Control PID

A continuación, se muestra un ejemplo de cómo modificar `controller.m` para implementar un control PID:

```matlab
% Función de control para inyectar una fuerza "u" para mover
% el cabezal sobre el riel en una impresora 3D.
% xref: posición de referencia para el cabezal.
% x   : posición actual del cabezal.
% v   : velocidad del cabezal.
% h   : tiempo transcurrido desde la última actualización del control.
function u = controller(xref, x, v, h)
    kp = 10;
    kd = 8;
    ki = 0;
    persistent integral;
    if isempty(integral)
       integral = 0; 
    end
    integral = integral + h * (x - xref);
    u = -kp * (x - xref) - kd * v - ki * integral;
end
