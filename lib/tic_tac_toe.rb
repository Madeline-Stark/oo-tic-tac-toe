# previous lesson has initialize, current player, turn count, display board
# can start by copying those over
# read the readme!

# do as group: 
# initialize, win combo, display board

# then break into groups, remind to reference readme

class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end 

    WIN_COMBINATIONS = [ 
        # started for you in the readme
        # maybe give to them to save time?
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6, 7, 8],
        [0, 3, 6], 
        [1, 4, 7], 
        [2, 5, 8],
        [0, 4, 8], 
        [2, 4, 6]
    ]

    # copy from previous lesson
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        # just returning index number
        input.to_i - 1
    end


end