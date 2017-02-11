def rot13(secret_messages)
  # your code here
    letters = ("A".."Z").to_a
    minis = ("a".."z").to_a
    new_array = []
    secret_messages.each do |sentence| 
        new_array << sentence.chars.collect! do |x|
        	case
        	when letters.include?(x) then letters[letters.find_index(x) + 13 - letters.size]
        	when minis.include?(x) then minis[minis.find_index(x) + 13 - minis.size]
        	else x
        	end
        end
    end
    new_array.collect { |array| array.join}
    
end

print rot13(["This is some shit", "Some more shit."])