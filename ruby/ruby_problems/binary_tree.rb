require 'byebug'

class Node
	attr_accessor :value, :parent, :child_1, :child_2

	def initialize(value)
		@value = value
		@parent = nil
		@child_1 = nil
		@child_2 = nil
	end

end


class BinaryTree

	def initialize(array)
		@root = Node.new(array.shift)

		array.each do |number|
			node = Node.new(number)
			pointer = @root

			until node.parent
				if number <= pointer.value && pointer.child_1 == nil
					pointer.child_1 = node
					node.parent = pointer
				elsif number <= pointer.value
					pointer = pointer.child_1
				elsif number >= pointer.value && pointer.child_2 == nil
					pointer.child_2 = node
					node.parent = pointer
				elsif number >= pointer.value
					pointer = pointer.child_2
				end
			end

		end
	end

	def breadth_first_search(target)
		result = nil

		if @root.value == target
			result = @root
		else
			queue = [@root.child_1, @root.child_2]

			queue.each do |node|
				if node.value == target
					result = node
					break
				else
					queue += [node.child_1, node.child_2]
					queue.shift
				end
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

			until stack.length == 0
				byebug
				if stack[-1].value == target
					result = stack[-1]
					break
				elsif stack[-1].child_1
					stack << stack[-1].child_1
					stack[-2].child_1 = nil
				elsif stack[-1].child_2
					stack << stack[-1].child_2
					stack[-2].child_2 = nil
				else
					stack.pop
				end
			end
		end
		result
	end

	def depth_first_recursive(target, current_node=@root)
		if !current_node.child_1 && !current_node.child_2
			return
	end
	

end

tree = BinaryTree.new([7,4,5,0,8,33,5,9,19])

tree.breadth_first_search(9)

tree.depth_first_search(9)







