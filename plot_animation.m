function draw_printer_head( traj, xref, t, T, h )
subplot(3,1,[1,2]);
x = traj(t);
xlim = 10;
time = 0:h:t*h;
time = time(1:min(numel(traj),numel(time)));
plot(time, traj(1:numel(time))); hold on;
plot([t*h,t*h],[0,xlim],'r','Linewidth',2)
plot([0,T],[xref,xref],'k--','Linewidth',2)
text(T+0.1, xref, ['$x_{ref}$=',num2str(xref),'$cm$'],'Interpreter', 'latex');
axis([0,T,0,xlim]);
text(T+0.1,0,'time [s]','Interpreter', 'latex')
ylabel('$x(t) [cm]$','Interpreter', 'latex')

subplot(3,1,3);
rectangle('Position', [0, 0.25, xlim, 0.25], 'FaceColor', [0.5, 0.5, 0.5]); hold on;
rectangle('Position', [x-0.25, 0.1, 0.5, 0.5], 'FaceColor', [0.5, 0.5, 0.5]);
patch([x,x-0.1,x+0.1], [0,0.1,0.1], [0.5, 0.5, 0.5]); % 'blue' is the color of the triangle

plot([xref,xref],[0,1],'k--','Linewidth',2)
text(xlim+0.1,0,'$x(t) [cm]$','Interpreter', 'latex');
text(xref-0.25, 0.8, ['$x_{ref}$=',num2str(xref),'$cm$'],'Interpreter', 'latex');

axis([0,xlim,0,0.75]);
end

