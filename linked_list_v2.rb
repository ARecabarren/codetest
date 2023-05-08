# Class representing the full list
class LinkedList
    attr_reader :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        new_node = Node.new(value, @tail)
        @tail = new_node
    end

    def prepend(value)
        new_node = Node.new(value)
        @head.next_node = new_node
        @head = new_node
    end
end

# Class representing list items
def Node(value = nil, next_node = nil)
    attr_accessor :value, :next_node

    def initialize
        @value = value
        @next_node = next_node
    end

end