class Game
	attr_accessor :board

	def initialize()
		@board = []
		8.times{|i|
			8.times{|j|
				@board << [i,j]}}
	end

	def knight_moves(origin, destination)

	end

end

class Knight
	attr_accessor :position

	def initialize(position=[0,0])
		@position = position
	end

	def possible_moves()
		moveset = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]
		result = []
		8.times do |i|
			x = moveset[i][0]
			y = moveset[i][1]
			if (0..7).cover?(@position[0]+x) && (0..7).cover?(position[1]+y) then
				result << [@position[0]+x, position[1]+y]
			end
		end
		return result
	end
end

game = Game.new
knight = Knight.new([4,3])
print knight.possible_moves