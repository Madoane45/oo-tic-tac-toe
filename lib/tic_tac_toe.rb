require "pry"
class TicTacToe

    def initialize
        @board = Array.new(9," ")
    end
    WIN_COMBINATIONS =
    [[0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [0,4,8]]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end
    def input_to_index(num)
        num.to_i - 1
    end

    def move (move,symbol="X")
        @board[move] = symbol
    end
    def position_taken?(position)
        if @board[position] == "X" || @board[position] == "O" 
                return true
        else
            return false
        end
    end
    def valid_move?(position)
        if position.between?(0,8) && !position_taken?(position)
            return true
        end
    end
    def turn_count
        counter = 0
        @board.each do |position|
            if position == "X" || position == "O"
                counter += 1
            end
            #binding.pry  
        end
        counter
    end
    def current_player
        turn_count.even? ? "X" : "O"
    end
    def turn
        input = gets.strip
        var = input_to_index(input)
       if valid_move?(var) == true
        move(var,current_player)
        display_board
       else 
        self.turn
       end
    end
    def won?
        WIN_COMBINATIONS.each do |win_combination|
            win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
   
    if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
      return win_combination
    end
  end
  return false
    end
    def full?
        @board.all?{|taken| taken == "X" || taken == "O"}
      end
    
      def draw?
        full? && !won?
      end
    
      def over?
        won? || draw?
      end
    
      def winner
        if combo = won?
          @board[combo[0]]
        end
      end
    
      def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
      end
end


