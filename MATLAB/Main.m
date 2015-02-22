
clear all;
close all;
clc;
% clear all variables
% close all graphs
% clear the inter-active command window
%---------------------------
% initialize the topology data-structures
%---------------------------
script_USA_CANADA_TOPOLOGY
% initialize a figure
% set the font size along the axes to 15 points
figure(1);
set(gca,'FontSize', 15);
title('Tree of Shortest Paths');
hold on;
% plot the graph in current figure
plot_graph(TOP, LOC);
figure(1);  % bring the figure to the front of the window
% pick the root of the tree
% set the weight matrix to be the edge distance
tree1=[7, 32, 22, 34, 35 6, 3, 16, 11, 30, 33, 38, 28]; 

tree2=[24, 1, 16, 29, 30, 15, 6, 38, 21, 35, 39, 33, 23];
src = tree1(1);
W   = DIST;  % weights = distances in miles
%-----------------------------------------------------------
% call the function to find the shortest paths
%-----------------------------------------------------------
D_array=inf*ones(N,N);
P_array=zeros(N,N);
for j=1:13
    [D_array(tree1(j),:),P_array(tree1(j),:)]  = Dijkstra_tree_of_shortest_paths (tree1(j), TOP, W, N);
end
[D,P]  = Dijkstra_tree_of_shortest_paths (src, TOP, W, N);
%--------------------------------------------------------------
% now find the shortest path to each destination
% start each shortest path at the destination, and follow the
% predecessors back to the source
%--------------------------------------------------------------
fprintf('-------- Print Dijkstra-s Shortest Paths -----------\n')

D_sort=sort(D);
newtree=[tree1(1)];
for e=1:39
    for j=2:13
        if(D_sort(e)==D(tree1(j)))
            newtree=[newtree,tree1(j)];
        end
        
    end
    
end
tree1=newtree;

%for dst = 1:N
path_7=zeros(13,13);
% 
% for index=2:13
%     dst=tree1(index);
%     if (dst ~= src)
%         path = [dst]; % start the path with the DST node
%         node = dst;
%         % follow the predecessors, from the DST back to the SRC
%         while (node ~= src)
%             
%             %if(D(dst)<=D_array(dst,node))
%              pred = P(node); % find the predecessor
%             path = [pred, path]; % add predecessor to path 
%             
%             
% %             elseif(D(dst)>D_array(dst,node))
% %                 pred=P_array(dst,node);
% %                 path=[P_array(dst,node),path];
%            % end
%                 
%            %plot_edge(LOC, pred, node); % plot each edge
%                 if (pred == src)
%                    
%                     break; 
%                 end;
%             node = pred;   % current node becomes the predecessor, and repeat
%         end; % end while
%     fprintf('shortest path (src,dst)=(%g,%g) is : ', src, dst);
%     fprintf('%g  ', path);
%     fprintf('\n');
%     plot_path(LOC,path); 
%     end; 
% end;

%for j=[2,4,5,6,7]
for j=2:13
    source=tree1(j);
    for k=2:13
       node=tree1(k);
       %record path from movable source to source7
        
        
        %record the path from node to relative source
        %if(D(source)<D(node))
            if(D_array(source,node)<D(node)&&(source~=node))
                dst_1=source;
                path_1 = [dst_1]; % start the path with the DST node
                source_1=tree1(1);
                 while (dst_1 ~= source_1)
                    pred_1 = P(dst_1); % find the predecessor
                    path_1 = [pred_1, path_1]; % add predecessor to path 
                      if (pred_1 == source_1)
                            break; 
                      end;
                    dst_1 = pred_1;   % current node becomes the predecessor, and repeat
                  end; % end while
                fprintf('shortest path_1 (src_1,dst_1)=(%g,%g) is : ', source_1, source);
                fprintf('%g  ', path_1);
                %fprintf('%g  ', dst_1);
                fprintf('\n');
               
                dst_2=node;
                path_2 = [dst_2]; % start the path with the DST node
                source_2=source;
                 while (dst_2 ~= source_2)
                    pred_2 = P_array(source_2,dst_2); % find the predecessor
                    path_2 = [pred_2, path_2]; % add predecessor to path 
                      if (pred_2 == source_2)
                            break; 
                      end;
                    dst_2 = pred_2;   % current node becomes the predecessor, and repeat
                  end; % end while
        fprintf('shortest path_2 (src_2,dst_2)=(%g,%g) is : ', source_2, node);
        fprintf('%g  ', path_2);
        fprintf('\n');       
        flag=1;
        i=0;
        [r c1]=size(path_1);
        [r c2]=size(path_2);
        for m=1:c1
            a=path_1(m);
            for n=1:c2
                b=path_2(n);
                if (a==b)
                    i=i+1;
                     %fprintf('ele=%g \n',path_1(m))
                end
            end
            
        end
       

        fprintf('i=%g \n',i)
                   
                 if(i<2)
                   fprintf('go......................in the loop \n');
                   % if(P_array(source,node)~=P_array(7,node))
                    D(node)=D_array(source,node)+D(source);
                    while(node~=source)
                        P(node)=P_array(source,node);
                        node=P(node);
                        if(node==source)
                            break;
                        end
                    end
               % end
                 end
            end
      % end
    end
end
for index=2:13
    dst=tree1(index);
    if (dst ~= src)
        path = [dst]; % start the path with the DST node
        node = dst;
        % follow the predecessors, from the DST back to the SRC
        while (node ~= src)
            
            %if(D(dst)<=D_array(dst,node))
             pred = P(node); % find the predecessor
             path = [pred, path]; % add predecessor to path 
            
%             elseif(D(dst)>D_array(dst,node))
%                 pred=P_array(dst,node);
%                 path=[P_array(dst,node),path];
           % end
                
           %plot_edge(LOC, pred, node); % plot each edge
                if (pred == src)
                    break; 
                end;
            node = pred;   % current node becomes the predecessor, and repeat
        end; % end while
    fprintf('shortest path_final (src,dst)=(%g,%g) is : ', src, dst);
    fprintf('%g  ', path);
    fprintf('\n');
    plot_path(LOC,path); 
    end; 
end;



% save the graph as .png file
if (1 == 1)
    fprintf('Creating FIG_1 Dijkstra_tree_(src=%g)\n', src);
    filename = sprintf('FIG_1_Dijkstra_tree_(src=%g).png',src);
    saveas(gcf, filename);
end;
%-------------------------- end MAIN.m -----------------------------------
%---------------------------------------------------
% DIJKSTRA-s TREE OF SHORTEST PATHS
%-------------------------------------------------
% returns 2 vectors of length N, called D and P
% vector D, where D(1,j) == shortest distance between (src,j)
% vector P, where P(j) = predecessor of node j toward the source
%-------------------------------------------------
