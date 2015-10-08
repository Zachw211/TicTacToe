class TicTacToe

	attr_accessor :p1_name, :p2_name

	def initialize
		@board = []
		9.times {@board << "-"}  #create 9 empty board space
		@turn = 0				#variable to track the turn number
		@p1 = Player.new("X")
		@p2 = Player.new("O")
		@playing = true

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

	def turn
		@turn % 2 == 0 ? "X" : "O"
	end

	def move
		puts "Where would you like to move? (spaces 1-9)"
		move = gets.chomp.to_i
		whose = turn
		@board[move-1] = turn
		@turn +=1

		display
	end


	def play
		puts "Welcome to command line Tic Tac Toe."
		puts "Please enter Player One's name:"
		@p1.name = gets.chomp
		puts "Thank you #{@p1.name}. You are X."
		puts "Please enter Player Two's name:"
		@p2.name = gets.chomp
		puts "Thank you #{@p2.name}. You are O."
	
	end

	class Player

		attr_accessor :name, :symbol

		def initialize(symbol)
			@name = nil
			@symbol = symbol
		end

	end
end

test = TicTacToe.new

test.play
test.move
test.move