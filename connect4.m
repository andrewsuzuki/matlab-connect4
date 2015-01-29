% Connect 4
% By: Andrew Suzuki
% Date: 12/01/2014
% ***********************

% Clear environment
clear;
clc;

% Create blank board
board = zeros(6, 7);

% Ask for mode (must be 1 or 2)
mode = 0;
while mode ~= 1 && mode ~= 2
    fprintf('Would you like to play PvP (enter 1), or against a computer (enter 2)?\n');
    mode = input('Enter: ');
end

% Assign player chip characters and ask for player names
if mode == 1
    player1_char = '1';
    player2_char = '2';
    player1_name = input('Player 1: What is your name? ', 's');
    player2_name = input('Player 2: What is your name? ', 's');
else
    player1_char = '1';
    player2_char = 'c';
    player1_name = input('What is your name? ', 's');
    player2_name = 'COMPUTER';
end

% Player toggle
player = 2;

% Init result var
result = 0;

% Loop while result is 0
while ~result
    % Toggle player
    if player == 1
        player = 2;
        name = player2_name;
    else
        player = 1;
        name = player1_name;
    end
    
    % Space between turns
    fprintf('\n');
        
    if mode == 2 && player == 2
        % Have computer make move is mode is 2 and it's the comp's turn
        board = makeMove(board);
    else
        % Otherwise, show board and ask player to play
        displayBoard(board, player1_char, player2_char);
        board = play(player, name, board);
    end
    
    % Check if a player won
    result = evaluateBoard(board);
end

% If there was a winner
if result == 1 || result == 2
    % Display winner and final board to users
    fprintf('\n____________________\nWINNER...%s!!!\n\n', name);
else
    % It was a draw.
    fprintf('\n____________________\nIt''s a draw!\n\n');
end

fprintf('Final board:\n');
displayBoard(board, player1_char, player2_char);