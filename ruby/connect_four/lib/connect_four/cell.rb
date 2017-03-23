module ConnectFour
	class Cell
		attr_accessor :value

		def initialize(value=:empty)
			@value = value
		end
	end
end
