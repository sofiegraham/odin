class StringCalculator

	 def self.add(string)
	 	if string.empty?
	 		0
	 	else
	 		numbers = string.split(",").map {|num| num.to_i}
	 		numbers.inject(0) {|sum,num| sum + num}
	 	end
	 end
end

=begin
class StringCalculator
	 	if string == ""
	 		0
	 	else
		 	numbers_array = string.split(",")
		 	numbers_array.map! {|x| x = x.to_i}
		 	numbers_array.inject(0) {|sum,num| sum + num}
	 	end
	 end
=end

