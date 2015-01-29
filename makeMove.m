function board = makeMove(board)

    % *** Check if there is a winning move (either player)
    
    % Keep track of potential connect-4s (to prioritize wins over blocks)
    potentials = [];
    
    % Potential horizontal connect-4
    for row = 1:6
        for col = 1:4
            % Grab these four
            four = board(row, col:(col+3));
            
            % Count zeros, ones, and twos
            equalzero = histc(four, 0);
            equalone = histc(four, 1);
            equaltwo = histc(four, 2);
            
            % If three equal 1 or 2 and one equals 0...
            if equalzero == 1 && (equalone == 3 || equaltwo == 3)
                % 3 of four are filled, attempt to block/win
                for subcol = 1:4
                    % Check if move is valid
                    if validPlay(board, row, col+subcol-1)
                        % Pot. connect-4, add to list (row, col, win bool)
                        potentials = [potentials; row, col+subcol-1, (equaltwo == 3)];
                    end
                end
            end
        end
    end
    
    % Potential vertical connect-4
    for row = 1:3
        for col = 1:7
            % Grab these four
            four = board(row:(row+3), col);
            
            % Count zeros, ones, and twos
            equalzero = histc(four, 0);
            equalone = histc(four, 1);
            equaltwo = histc(four, 2);
            
            % If three equal 1 or 2 and one equals 0...
            if equalzero == 1 && (equalone == 3 || equaltwo == 3)
                % 3 of four are filled, attempt to block/win
                for subrow = 1:4
                    % Check if move is valid
                    if validPlay(board, row+subrow-1, col)
                        % Pot. connect-4, add to list (row, col, win bool)
                        potentials = [potentials; row+subrow-1, col, (equaltwo == 3)];
                    end
                end
            end
        end
    end
    
    % Potential diagonal connect-4
    for row = 1:3
        for col = 1:4
            % Get this diagonal
            four = [board(row, col), board(row+1, col+1), board(row+2, col+2), board(row+3, col+3)];

            % Count zeros, ones, and twos
            equalzero = histc(four, 0);
            equalone = histc(four, 1);
            equaltwo = histc(four, 2);
            
            % If three equal 1 or 2 and one equals 0...
            if equalzero == 1 && (equalone == 3 || equaltwo == 3)
                % 3 of four are filled, attempt to block/win
                for sub = 1:4
                    % Check if move is valid
                    if validPlay(board, row+sub-1, col+sub-1)
                        % Pot. connect-4, add to list (row, col, win bool)
                        potentials = [potentials; row+sub-1, col+sub-1, (equaltwo == 3)];
                    end
                end
            end

            % Get inverse diagonal
            four = [board(7-row, col), board(6-row, col+1), board(5-row, col+2), board(4-row, col+3)];

            % Count zeros, ones, and twos
            equalzero = histc(four, 0);
            equalone = histc(four, 1);
            equaltwo = histc(four, 2);
            
            % If three equal 1 or 2 and one equals 0...
            if equalzero == 1 && (equalone == 3 || equaltwo == 3)
                % 3 of four are filled, attempt to block/win
                for sub = 1:4
                    % Check if move is valid
                    if validPlay(board, 8-row-sub, col+sub-1)
                        % Pot. connect-4, add to list (row, col, win bool)
                        potentials = [potentials; 8-row-sub, col+sub-1, (equaltwo == 3)];
                    end
                end
            end
        end
    end
    
    % Get size of potentials list
    [poty,potx] = size(potentials);
    i = 1;
    for pot = potentials'
        pot = pot';
        
        % If this potential connect-4 is a win or it the last on the list
        if pot(3) == 1 || poty == i
            % Place chip
            board(pot(1), pot(2)) = 2;
            % Return function
            return;
        end
        i = i + 1;
    end
            
    % *** If no block/win is possible, play random move
    
    % Pick random column (as long as column is not full)
    col = randperm(7, 1);
    while board(1, col)
        col = randperm(7, 1);
    end
    
    % Determine row to play
    for row = 1:6
        if row == 6 || board(row+1, col)
            break;
        end
    end
    
    % Place chip as 2
    board(row, col) = 2;
end