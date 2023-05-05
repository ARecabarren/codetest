module LinkedList
    
    class Node
        attr_reader :value
        attr_accessor :next_node
        attr_reader :head

        @@count = 0
        def initialize(value, next_node = nil)
            @head = @@count > 0 ? false : true

            @value = value
            @next_node = next_node
            @@count += 1
        end

        def is_head?
            self.head
        end


    end


end

include LinkedList
head_node = Node.new('I am the head')
puts head_node.is_head?

second_node = Node.new('I am the second node')

puts second_node.is_head?
