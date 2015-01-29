function board = play(player, name, board)
    % Display player name
    fprintf('Turn: %s (player %.0f)\n', name, player);
    
    % Loop to check input validity
    valid = 0;
    while ~valid
        % Ask player for position to play
        fprintf('Where do you want to place the next chip?\n');
        col = input('Column: ');
        row = input('Row: ');
        
        % Convert player-perspective row to actual
        row = 7-row;
        
        % Check if valid play
        if validPlay(board, row, col)
            valid = 1;
            break;
        end
        
        fprintf('Invalid choice. Please choose again.\n');
    end
    
    % Place chip on board
    board(row, col) = player;
end