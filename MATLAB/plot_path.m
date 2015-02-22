function plot_edge(LOC, path)

[r,c] = size(path);
    
 for index = 1:(c-1)
    u = path(index);
    v = path(index+1);
        
    x1= LOC(u,1);
    y1= LOC(u,2);
    x2= LOC(v,1);
    y2= LOC(v,2);
    
    plot([x1,x2],[y1,y2], 'b',  'LineWidth', 2);  % blue line
    hold on;
    
 end
 
 
dst= path(c);
x1= LOC(dst,1);
y1= LOC(dst,2);

    plot(x1,y1, 'or',  'LineWidth', 6); %red circle at destination node
end