%% Parámetros del sistema cabezal-riel en una impresora 3D

m = 1;              % Masa del cabezal 
x0 = 2;             % Condición inicial para la posición del cabezal
xref = 5;           % Posición deseada para el cabezal
disturbance = 0;    % Posible perturbación
T = 20;             % Tiempo de simulación              

%% Simulación del sistema

h = 1e-1;
time = 0:h:T;
x = zeros(1,numel(time));
v = zeros(1,numel(time));
x(1) = x0;

myfig = figure(2);
myfig.Renderer='Painters';
set(gcf,'color','w');
for t = 2 : numel(time)
    clf(myfig);
    
    % Se obtiene el controlador
    u = controller(xref,x(t-1),v(t-1),h);
    
    % Evolución del sistema
    x(t) = x(t-1) + h*v(t-1);
    v(t) = v(t-1) + h*(u + disturbance)/m;
    
    % Generar animación
    plot_animation( x, xref, t-1, T, h );
    annotation('textbox', [0.1, 0.8, 0.1, 0.1], 'String', sprintf('t= %0.2f s', t*h), 'FitBoxToText', 'on', 'BackgroundColor', 'white');
    drawnow;
end



