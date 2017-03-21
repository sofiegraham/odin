module ConnectFour
	class Cell
		attr_accessor :value

		def initialize(value=:empty)
			@value = value
		end
	end
end
=begin
	class NodeCell
		attr_accessor :value

		def initialize(value=:empty, coordinates=nil, north_child=nil, north_east_child=nil,
			east_child=nil, south_east_child=nil, south_child=nil, south_west_child=nil,
			west_child=nil, north_west_child=nil)

			@value = value
			@coordinates = coordinates
			@north_child = north_child
			@north_east_child = north_east_child
			@east_child = east_child
			@south_east_child = south_east_child
			@south_child = south_child
			@south_west_child = south_west_child
			@west_child = west_child
			@north_west_child = north_west_child
		end
	end
end

=end
