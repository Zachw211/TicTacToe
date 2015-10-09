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
		@turn % 2 == 0 ? @p1 : @p2
	end

	def move
		who = turn
		puts "#{who.name}, where would you like to move? (spaces 1-9)"
		move = gets.chomp.to_i
		@board[move-1] = who.symbol
		@turn +=1

	end


	def welcome
		puts "Welcome to command line Tic Tac Toe."
		puts "Please enter Player One's name:"
		@p1.name = gets.chomp
		puts "Thank you #{@p1.name}. You are X."
		puts "Please enter Player Two's name:"
		@p2.name = gets.chomp
		puts "Thank you #{@p2.name}. You are O."
		puts "To play, enter a space nubmer. Player one will go first."
		puts "The spaces are:"
		puts "1 | 2 | 3"
		puts "___________"
		puts "4 | 5 | 6"
		puts "___________"
		puts "7 | 8 | 9"
		puts
	end

	def play
		welcome
		while @playing && @turn < 9
			move
			display
		end
	
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
