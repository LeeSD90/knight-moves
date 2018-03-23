require 'io/console'
class Game

	def initialize()

	end

	def knight_moves(origin, destination)
		board = Board.new
		knight = Knight.new(origin)
		queue = [knight]

		until knight.position == destination
			knight = queue.shift
			knight.moves.each do |move|
				node = Knight.new(move)
				node.parent = knight
				queue << node
			end
		end
		return knight.to_s
	end

end

class Board
	attr_accessor :squares

	def initialize()
		@squares = []
		8.times{|i|
			8.times{|j|
				@squares << [i,j]}}
	end
end

class Knight
	include Enumerable

	attr_accessor :position, :moves, :parent

	def initialize(position=[0,0])
		@position = position
		@parent = nil
		@moves = possible_moves(@position)
	end

	def possible_moves(position)
		moveset = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]
		result = []
		8.times do |i|
			x = moveset[i][0]
			y = moveset[i][1]
			if (0..7).cover?(position[0]+x) && (0..7).cover?(position[1]+y) then
				result << [position[0]+x, position[1]+y]
			end
		end
		return result
	end

	def each
		parent = @parent

		until parent.nil?
			yield parent
			parent = parent.parent
		end
	end

	def to_s()
		puts "The knight reached its destination in #{self.count} moves. It followed this path:"
		self.reverse_each{|k| p k.position }
		p self.position
	end
end

game = Game.new
game.knight_moves([3,3], [4,3])