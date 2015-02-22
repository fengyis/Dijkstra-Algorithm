function plot_graph(TOP, LOC)
[r,c] = size(LOC);
N = r;  % number of rows in LOCATION matrix
%  draw each node in the current open figure window
for u = 1:N
     x = LOC(u, 1);  % get x coordinate of node u
     y = LOC(u, 2);  % get y coordinate of node u
     plot(x,y, 'ok', 'LineWidth', 8);  % black circle for the node
     if (1 == 1)
        fprintf('adding node number %g onto figure \n', u);
        text(x+1, y+1, sprintf('%g', u), 'FontSize', 14);
        hold on
end; end;
% now add black lines for the edges
for u=1:N
    for v=1:N
        if (TOP(u,v) == 1)
             % plot the edge between nodes (u,v)
             x1 = LOC(u, 1);
             y1 = LOC(u, 2);
             x2 = LOC(v, 1);
             y2 = LOC(v, 2);
             plot([x1,x2],[y1,y2]);  % black line
        end;
    end; 
end;
% you can set the range of the visible X,Y axes
minx = -125;
maxX = -60;
minY = 20;
maxY = 60;
axis([ minx, maxX, minY, maxY ]);
fprintf('Finished function print_graph; see active figure \n'); 
