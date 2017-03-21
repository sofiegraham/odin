module ConnectFour
	class Player
		attr_accessor :name, :color

		def initialize(details_hash)
			@color = details_hash.fetch(:color)
      @name = details_hash.fetch(:name)
		end

	end

end
