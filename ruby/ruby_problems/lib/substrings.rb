def substrings (word, list_of_words)
	count_of_substrings = Hash.new(0)

	list_of_words.each do |maybe|
		if word.downcase.include? (maybe.downcase)
			count_of_substrings[maybe.downcase] += word.downcase.scan(/#{maybe.downcase}/).count
		end
		
	end
	p count_of_substrings

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)