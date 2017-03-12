require 'byebug'

class Node
	attr_accessor :value, :parent, :child_left, :child_right

	# attr_reader :value
	# puts self.value
	# puts value
	# attr_writer :value
	# self.value = true

	def initialize(value)
		@value = value
		@parent = nil
		@child_left = nil
		@child_right = nil
	end

	#Helper method to assign child

end


class BinaryTree

	def initialize(array)
		@root = Node.new(array.shift)



		array.each do |number|
			node = Node.new(number)
			pointer = @root

			until node.parent
				if number <= pointer.value && !pointer.child_left
					pointer.child_left = node
					node.parent = pointer #Here! Help!
				elsif number <= pointer.value
					pointer = pointer.child_left
				elsif number >= pointer.value && !pointer.child_right
					pointer.child_right = node
					node.parent = pointer #Also here.
				elsif number >= pointer.value
					pointer = pointer.child_right
				end
			end
			#If number <= pointer.val if child doesn't exist assign child, else assign pointer (do same with greater).

		end
	end

	def breadth_first_search(target)
		result = nil
		queue = [@root]

		until queue.length == 0
			if queue[0].value == target
				result = queue[0]
				break
			else
				queue << queue[0].child_left if queue[0].child_left
				queue << queue[0].child_right if queue[0].child_right
				queue.shift
			end
		end
		result
	end

	def depth_first_search(target)
		result = nil

		if @root.value == target
			result = @root
		else
			stack = [@root]
			checked = []

			until stack.length == 0
				if stack[-1].value == target
					result = stack[-1]
					break
				elsif stack[-1].child_left && !checked.include?(stack[-1].child_left)
					stack << stack[-1].child_left
					checked << stack[-2].child_left
				elsif stack[-1].child_right && !checked.include?(stack[-1].child_right)
					stack << stack[-1].child_right
					checked << stack[-2].child_right
				else
					stack.pop
				end
			end
		end
		result
	end

	def depth_first_recursive(target, current_node=@root)
		#Store left search in variable.

		#if current node nil return nil.		



		if current_node.child_left && depth_first_recursive(target, current_node.child_left)
			depth_first_recursive(target, current_node.child_left)
		elsif current_node.value == target
			return current_node
		elsif current_node.child_right && depth_first_recursive(target, current_node.child_right)
			depth_first_recursive(target, current_node.child_right)
		else
			nil
		end
		
	end

	def depth_first_connor(target, current_node=@root)
		return nil unless current_node
		
		left_search = depth_first_connor(target, current_node.child_left)
		return left_search if left_search

		return current_node if current_node.value == target

		right_search = depth_first_connor(target, current_node.child_right)
		return right_search if right_search
	end

	def depth_first_recursive_preorder(target, current_node=@root)

		if current_node.value == target
			current_node	
		elsif current_node.child_left && depth_first_recursive(target, current_node.child_left)
			depth_first_recursive(target, current_node.child_left)
		elsif current_node.child_right && depth_first_recursive(target, current_node.child_right)
			depth_first_recursive(target, current_node.child_right)
		else
			nil
		end
		
	end

	

end

tree = BinaryTree.new([7,4,4,0,8,33,5,9,19])

puts tree.breadth_first_search(9)

puts tree.depth_first_search(9)

puts tree.depth_first_recursive(99)

puts tree.depth_first_connor(7)
puts tree.depth_first_connor(99)
puts tree.depth_first_connor(19)







