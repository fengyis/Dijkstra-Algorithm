function plot_edge(LOC, src, dst)
    [r,c] = size(LOC);
    N = r;  % number of nodes in graph
    x1= LOC(src,1);
    y1= LOC(src,2);
    x2= LOC(dst,1);
    y2= LOC(dst,2);
    plot([x1,x2],[y1,y2], 'b',  'LineWidth', 2);  % blue line
    hold on;
end % end function