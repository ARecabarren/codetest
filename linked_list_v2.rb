# Class representing the full list
class LinkedList
    def initialize
        
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