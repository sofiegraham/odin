module Enumerable

	def my_each
		arrayed = self.to_a
		i = 0
		while i < arrayed.length
			yield(arrayed[i]) if block_given? 
			i+=1
		end
		return arrayed
	end

	def my_each_with_index
		i = 0
		while i < self.length
			yield(self[i], i)
			i+=1
		end
		return self
	end

	def my_select
		selected = []
		self.my_each do |x|
			selected << x if yield(x)	
		end
		return selected
	end

	def my_all?
		self.my_each do |x|
			return false unless yield(x)
		end
		return true
	end

	def my_any?
		self.my_each do |x|
			return true if yield(x)
		end
		return false
	end

	def my_none?
		self.my_each do |x|
			return false if yield(x)
		end
		return true
	end

	def my_count var=nil
		counter = 0

		if block_given?
			self.my_each do |x|
				counter +=1 if yield(x)
			end
		elsif !var
			self.my_each do |x|
				counter += 1
			end
		else
			self.my_each do |x|
				counter +=1 if var==x
			end
		end
		return counter
	end

	#May method could take a proc OR a block

	def my_map code_proc=nil
		mapped = []
		if code_proc
			self.my_each do |x|
				mapped << code_proc.call(x)	
			end
		else
			self.my_each do |x|
				mapped << yield(x)	
			end
		end
		return mapped
	end

	#My inject method works for numbers and strings.

	def my_inject starter=nil
		everything = self.to_a

		if starter
			everything.unshift(starter)
		end
		everything.my_each_with_index do |x,ind|
			if ind == everything.length-1
				break
			else
				everything[0] = yield(everything[0], everything[ind+1])
			end
		end
		return everything[0]
	end

end

array = [1,2,3,4]

puts array.my_each

