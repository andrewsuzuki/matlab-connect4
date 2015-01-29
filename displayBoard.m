function displayBoard(board, player1_char, player2_char)
    % Display col header labels with divider
    fprintf('  1  2  3  4  5  6  7\n');
    fprintf('_______________________\n');
    
    % Loop rows and columns
    for row = 1:6
        % Two spaces before first col
        fprintf('  ');
        
        for col = 1:7
            % Determine character to use for position
            value = board(row, col);
            
            if value == 0
                char = '0';
            elseif value == 1
                char = player1_char;
            else
                char = player2_char;
            end
            
            % Print character in position with spaces to right
            fprintf('%s', char);
            fprintf('  ');
        end
        
        % Display row labels with left divider
        fprintf('|  %.0f\n', 7-row);
    end
end