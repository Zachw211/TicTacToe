class TicTacToe
	
	def initialize
		@board = []
		9.times {@board << "-"}
		@turn = 0

	end

	def display
		puts
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "___________"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "___________"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
		puts
		
	end

	def move
		puts "Where would you like to move? (spaces 1-9)"
		move = gets.chomp

		@board[move.to_i-1] = "x"

		display
	end
end

test = TicTacToe.new



test.move