function result = evaluateBoard(board)
    % Init result flag
    result = 0;
    
    % Search for horizontal connect-4
    for row = 1:6
        for col = 1:4
            % Grab these four
            fourinrow = board(row, col:(col+3));
            
            % If they all equal 1 or 2, set flag
            if fourinrow == 1
                result = 1;
                break;
            elseif fourinrow == 2
                result = 2;
                break;
            end
        end
    end
    
    % If no result, check for vertical connect-4
    if ~result
        for row = 1:3
            for col = 1:7
                % Grab these four
                fourincol = board(row:(row+3), col);

                % If they all equal 1 or 2, set flag
                if fourincol == 1
                    result = 1;
                    break;
                elseif fourincol == 2
                    result = 2;
                    break;
                end
            end
        end
    end

    % If no result, check for diagonal connect-4
    if ~result
        for row = 1:3
            for col = 1:4
                % Get this diagonal
                diagonal = [board(row, col), board(row+1, col+1), board(row+2, col+2), board(row+3, col+3)];
                
                % If they all equal 1 or 2, set flag
                if diagonal == 1
                    result = 1;
                    break;
                elseif diagonal == 2
                    result = 2;
                    break;
                end
                
                % Get inverse diagonal
                diagonal = [board(7-row, col), board(6-row, col+1), board(5-row, col+2), board(4-row, col+3)];
                
                % If they all equal 1 or 2, set flag
                if diagonal == 1
                    result = 1;
                    break;
                elseif diagonal == 2
                    result = 2;
                    break;
                end
            end
        end
    end
    
    % If no result, check for draw (full board)
    if ~result
        % Check if number of zeros is zero
        if sum(histc(board, 0)) == 0
            result = 3;
        end
    end
end