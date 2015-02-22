function [D,P]  = Dijkstra_tree_of_shortest_paths(src, TOP, W, N)
% src is some node from 1 to N
% initially, the vectors D and P are infinities
D  = inf * ones(1,N);
P  = inf * ones (1,N);
% record unvisited nodes in a Boolean vector of length N
% now add the source node to the visited list, with distance = 0
UV = ones(1,N);
UV(src)  = 0;
D(1,src) = 0;
current_node= src;
current_dist = 0;
for pass = 1:N
% all nodes labelled unvisited initially
% src is visited initially

%  fprintf('\nDijkstras algorithm, pass = %g : current_node = %g, current_distance =
%g\n',...
%      pass, current_node, current_dist);
%-------------------------------------------------------------------
% update the tentative distance to the neighbors of the current node
% ignore neighbors that are visited, since their shortest distances are known %-------------------------------------------------------------------
v = current_node;
for u =1:N
    if ( (TOP(v, u) == 1) && (UV(1,u) == 1) )
        % found an edge to an unvisited neighbor node, find tentative distance
        temp_dist = current_dist + W(v,u);
        if (temp_dist < D(1,u))
             D(1,u)   = temp_dist;  % record improved tentative distance
             P(1,u)   = v;
        end;
    end; 
end;
% fprintf('current_node = %g, neighbor = %g, new temp-dist = g\n',...
% v, u, temp_dist);
%------------------------------------------------
% add the next shortest path to the tree, ie find the unvisited node % with the lowest tentative distance
% search all N nodes, and find the node with the lowest tentative dst %-----------------------------------------------
min_distance = inf;
min_distance_node = inf;
for u=1:N
    if (UV(u) == 1)
         % check distance of this unvisited node
         if (D(1,u) < min_distance)
             % this is the new minimum distance
             min_distance = D(1,u);
             min_distance_node = u; % remember this node
        end; 
    end;
end;
% the node we just found becomes the current_node
% add it to the visited list, and repeat the loop if necessary
current_node = min_distance_node;
current_dist = min_distance;
UV(current_node) = 0;
if (sum(UV(1,:)) == 0)
    fprintf('Finished Dijkstra-s algorithm\n')
    return;
end;
end;  % for pass
