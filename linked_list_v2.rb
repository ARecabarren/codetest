# Class representing the full list
class LinkedList
    attr_accessor :head, :tail
    attr_reader :size

    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    def append(value)
        
        if @head == nil
            new_node = Node.new(value)
            @head = new_node
            @tail = new_node
        else
            new_node = Node.new(value, @tail)
            @tail = new_node
        end
        increment

    end

    def prepend(value)
        
        if @head == nil
            new_node = Node.new(value)
            @head = new_node
            @tail = new_node
        else
            new_node = Node.new(value)
            @head.next_node = new_node
            @head = new_node
        end
        increment
        
    end

    def increment
        @size += 1
    end
end

# Class representing list items
class Node
    attr_accessor :value, :next_node
    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end


myList = LinkedList.new
myList.append('First item')
myList.append('2nd item')
myList.prepend('I steal the 1st place')
puts myList.size
puts myList