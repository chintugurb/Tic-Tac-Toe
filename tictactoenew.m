%function [] = tictactoe()
    % Setup the figure/windows for the game
   index=[1,2,3;4,5,6;7,8,9];
   robot=zeros;
    figure('Name','Tic Tac Toe');
    plot(-1. -1)
    axis([0 3 0 3])
    set(gca,'xTick',0:3)
    set(gca,'yTick',0:3)
    set(gca,'xTickLabel','')
    set(gca,'yTickLabel','')
    xlabel('Player: X')
    grid on
    shg
    terminalStateReached = false;
    Table = [0 0 0 0 0 0 0 0 0];
    actionMatrix = findActionsforStates(Table);
    i=1
    while(terminalStateReached == false)
     
        [x y] = ginput(1);
        c=floor(x);
        r=floor(y);
        r=2-r;
          col=1+c;
           row=4-(1+floor(y));
           drawX(c,2-r);
        userPosition =index(row,col);
        Table(userPosition) = 2;
        stateIndex = stateIndexForTable(Table);
         fprintf('%d,',Table);fprintf('\n');
        [~,whoWonIfTerminal,isPresentStateTerminalState] = findRewardForAgentAction(stateIndex);
        if(isPresentStateTerminalState == false)
           [stateIndex,robot(i)] = epsilonGreedyAction(Q(stateIndex,:),actionMatrix(stateIndex,:),0);
             % see if next state is terminal state
                 
                 [row, col]=ind(robot(i))
                 r=3-row;
                 c=col-1;
                 r=2-r
                     drawO(c,2-r);
          [~,whoWonIfTerminal,isPresentStateTerminalState] = findRewardForAgentAction(stateIndex);
        i=i+1
        end
    
                   Table = tableForStateIndex(stateIndex);
                   fprintf('%d,',Table);fprintf('\n');
                   if(isPresentStateTerminalState == true)
        terminalStateReached = true;
        if(whoWonIfTerminal == 0)
            fprintf('Robot Won\n');
        elseif(whoWonIfTerminal == 1)
            fprintf('You Won\n');
        elseif(whoWonIfTerminal == 2)
            fprintf('Match Draw\n');
        end
                   end
    
    
end
