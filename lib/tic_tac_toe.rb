require 'pry'

# previous lesson has initialize, current player, turn count, display board
# can start by copying those over
# read the readme!

# do as group: 
# initialize, win combo, display board
# briefly intro idea of recursion, just a method calling itself:
# def add(sum, num)
#     if num > 10
#         num 
#     else 
#         add(sum, num)
#     end
# end

# then break into groups, remind to reference readme, review pairing protocol

class TicTacToe

    # DON'T DELETE FIRST THREE
    # in github link - tic tac toe starter code - share with students

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end 

    WIN_COMBINATIONS = [ 
        # started for you in the readme
        # maybe give to them to save time?
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8],
        [0,3,6], 
        [1,4,7], 
        [2,5,8],
        [0,4,8], 
        [2,4,6]
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

    def move(index, token="X")
        # change index of @board array to that token
        @board[index] = token 
    end

    def position_taken?(index)
        # returns true/false based on whether the position on the board is already occupied
        # @board[index] != " " ? true : false 
        @board[index] != " " # already returns boolean
    end

    def valid_move?(index)
       # @board[index] == " " #works, checks if empty and that is valid position
       !position_taken?(index) && index.between?(0, 8) # want opposite of position_taken return value
    end 

    def turn_count 
        # .count: If a block is given, counts the number of elements for which the block returns a true value.
        @board.count {|x| x != " "}
       # want to know how many turns have happened, so count filled spaces
    end 

    def current_player
        turn_count.even? ? "X" : "O"
    end 

    def turn 
        # ask for input
        puts "Please enter a position: 1-9"
        # get input
        input = gets.strip # to eliminate white space
        # translate input into index
        input = input_to_index(input)
        # if index is valid
        if valid_move?(input)
        # make the move for index
            move(input, current_player)
        # show the board
            display_board
        # else
        else 
        # ask for input again
            turn 
        # end
        end 
    end 

    def won? 
        # hint: use WIN_COMBINATIONS to access elements of the @board array
        # .find might also be helpful here

        # will need to iterate through win combos 
        # use find to return the first combo for which condition is true, nil if none are
        WIN_COMBINATIONS.find do |combo|
            # combo is an array of index numbers
            # access one index number at a time to access that index of board
            # compare and see if all equal/have same token
            # need to make sure not all empty string by using position_taken too
            position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        end
    end

    def full?
        @board.all? do |el|
            el != " "
        end
    end 

    def draw? 
        full? && !won?
    end 

    def over? 
        won? || draw?
    end 

    def winner 
        # won? returns the winning array of indexes, use one of them to access the winning token
        won? ? @board[won?[0]] : nil
    end 

    def play 
        # until the game is over
        #     take turns
        #   end
        until over? 
            turn 
        end 
           
        #   if the game was won
        if won?
        #     congratulate the winner
            puts "Congratulations #{winner}!"
        #   else if the game was a draw
        else
        #     tell the players it ended in a draw
            puts "Cat's Game!"
        #   end
        end 

    end 


end
