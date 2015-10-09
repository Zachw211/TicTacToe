class TicTacToe
	@@winCon = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
	attr_accessor :p1_name, :p2_name

	def initialize
		@board = []
		9.times {@board << "-"}  #create 9 empty board space
		@turn = 0				#variable to track the turn number
		@p1 = Player.new("X")
		@p2 = Player.new("O")
		@playing = true
		@winner = nil

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
		@turn % 2 == 0 ? move(@p1) : move(@p2)
	end

	def move(player)
		puts "#{player.name}, where would you like to move? (spaces 1-9)"
		move = gets.chomp.to_i - 1
		if valid(move)
			@board[move] = player.symbol
			@turn += 1
		else
			invalid(player)
		end

		victory?(player)
	end

	def valid(move)
		move.between?(0,8) && @board[move] == "-"
	end

	def invalid(player)
		puts "That is an invalid choice. Please go again"
		turn
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

	def victory?(player)
		@@winCon.each do |win|
			if win.all? {|i| @board[i] == player.symbol}
				@playing = false
				@winner = player.name
			end
		end
	end

	def gameOver
		if @winner
			puts "Congratulations, #{@winner}! You won! Play again? (y/n)"
		else
			puts "It's a draw! Play again?(y/n)"
		end
		if gets.chomp == "y"
			game = TicTacToe.new
			game.play
		else
			puts "Thanks for playing!"
			exit
		end

	end

	def play
		welcome
		while @playing && @turn < 9
			turn
			display
		end
		gameOver
	
	end

	class Player

		attr_accessor :name, :symbol

		def initialize(symbol)
			@name = nil
			@symbol = symbol
		end

	end
end

game = TicTacToe.new

game.play
