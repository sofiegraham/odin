def bubble_sort list
	list.length.times do 
		list.each_with_index do |item, index|
			if index == list.length-1
				break
			elsif item > list[index+1]
				list[index], list[index+1] = list[index+1], list[index]
			end
		end
	end
	return list
end

puts bubble_sort([3,9,4,2,7,4,0,2])

def bubble_sort_by list
	list.length.times do
		list.each_with_index do |item, index|
			if index == list.length-1
				break
			else
				block = yield(item, list[index+1])
				if block > 0
					list[index], list[index+1] = list[index+1], list[index]
				end
			end
		end
	end
	return list
end

puts bubble_sort_by(["hi","hello","hey"]) {|item1, item2| item1.length - item2.length}


puts bubble_sort_by([8,99,9,0,2,8]) {|item1, item2| item1 - item2}
