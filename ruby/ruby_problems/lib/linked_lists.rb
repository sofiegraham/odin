require 'byebug'

class LinkedList
	attr_accessor :name

	def initialize
		@head = nil
	end

	def append (value)
		if !@head
			@head = Node.new(value)
		else
			pointer = @head
			until pointer.next_node == nil
				pointer = pointer.next_node
			end
			pointer.next_node = Node.new(value)
		end
	end

	def prepend (value)
		if !@head
			@head = Node.new(value)			
		else
			old_head = @head
			@head = Node.new(value)
			@head.next_node = old_head
		end
	end

	def size
		if !@head
			0
		else
			count = 1
			pointer = @head
			while pointer.next_node != nil
				count += 1
				pointer = pointer.next_node
			end
			count
		end
	end

	def head
		@head ? @head : nil
	end

	def tail
		pointer = @head
		until pointer.next_node == nil
			pointer = pointer.next_node
		end
		pointer
	end

	def at_index(index)
		if !@head
			nil
		else
			pointer = @head
			i = 0
			until i >= index
				pointer = pointer.next_node
				i += 1
			end
			pointer
		end
	end

	def pop
		if !@head
			nil
		elsif @head.next_node == nil
			@head = nil
		else
			pointer = @head
			until pointer.next_node == nil
				previous_node = pointer
				pointer = pointer.next_node
			end
			previous_node.next_node == nil
		end
	end

	def contains?(value)
		if !@head
			nil
		else
			pointer = @head
			until pointer.next_node == nil
				if pointer.value == value
					return true
					break
				end
				pointer = pointer.next_node
			end
			pointer.value == value ? true : false
		end
	end

	def find(value)
		index = 0
		pointer = @head
		until pointer.next_node == nil
			if pointer.value == value
				return index
				break
			end
			pointer = pointer.next_node
			index += 1
		end
		pointer.value == value ? index : nil
	end

	def to_s		
		if !@head
			puts "nil"
		else
			pointer = @head
			data = [pointer.value]
			until pointer.next_node == nil
				data << pointer.next_node.value
				pointer = pointer.next_node
			end
			print "( #{data.join(" ) -> ( ")} ) -> nil"
		end
	end

	def insert_at(index, value)
		if index <= 0
			prepend(value)
		else
			pointer = @head
			previous_node = @head
			i = 0
			until i == index
				previous_node = pointer
				pointer = pointer.next_node
				i += 1
			end
			previous_node.next_node = Node.new(value)
			previous_node.next_node.next_node = pointer
		end
	end

	def remove_at(index)
		if index == 0
			@head = @head.next_node
		else
			pointer = @head
			previous_node = @head
			i = 0
			until i == index
				previous_node = pointer
				pointer = pointer.next_node
				i += 1
			end
			previous_node.next_node = pointer.next_node
		end
	end

end

class Node
	attr_accessor :value, :next_node

	def initialize (value)
		@value = value
		@next_node = nil
	end
end

waffles = LinkedList.new