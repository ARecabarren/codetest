# Class representing the full list
class LinkedList
    attr_accessor :head, :tail
    attr_reader :size, :array

    def initialize
        @head = nil
        @tail = nil
        @size = 0
        @array = []
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
        @array.push(new_node)

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
        @array.unshift(new_node)
        
    end

    def increment
        @size += 1
    end

    def at_index(index)
        @array[index]
    end

    def pop
        @array.pop
        @tail = @tail.next_node
    end

    #Implement binary search later, reduce time complexity
    def contains?(entry)
        @array.map {|node| node.value}.include?(entry)
    end

    def find(entry)
        self.each_with_index do |value, index|
            return index if value == entry
        end
        nil
    end

    include Enumerable
    def each_with_index
        return nil if @head == nil
        node = @tail
        index = @array.length - 1
        until node.next_node.nil? && index < 0
            yield node.value, index
            node = node.next_node
            index -= 1
        end
    end

    def each
        return nil if @head == nil

        entry = @tail
        until entry.nil?
            yield entry
            entry = entry.next_node
        end
    end

    def to_s
        string = ""
        self.each do |node|

            node.next_node.nil? ? string += "( #{node.value} ) -> nil" : string += " ( #{node.value} ) ->"
        end
        puts string
    end

    #Add insert_at(value, index)
    def insert_at(value, index)
        return "Out of range" if self.at_index(index).nil?
        return prepend(value) if index.zero?
        
        precedent_node = self.at_index(index).next_node
        new_node = Node.new(value, precedent_node)

        #Rewire
        self.at_index(index).next_node = new_node

        #Rearrange array
        @array = @array.slice(0..index - 1).append(new_node, @array.slice(index..)).flatten
        
    end
    #Add remove_at(value, index)
    def remove_at(index)
        return "Out of range" if self.at_index(index).nil?
        return self.pop if index == @array.length - 1

        precedent_node = self.at_index(index - 1).next_node
        post_node = self.at_index(index + 1)

        #Remove pointer
        self.at_index(index).next_node = nil
        #Rewind
        post_node.next_node = precedent_node
        #Rearrange array
        @array = @array.slice(0..index - 1).append(@array.slice(index + 1..)).flatten

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
# puts myList.at_index(0).value


myList.append('2nd item')
myList.prepend('I steal the 1st place')
# puts myList.at_index(0).value

myList.append('3rd item')
# puts myList.contains?('First item')
# puts myList.contains?('I steal the 1st place')
# puts myList.find('First item')

# puts myList.find('I steal the 1st place')
# myList.to_s

# puts myList.size
# puts myList.head.value
# puts myList.tail.value

newList = LinkedList.new
newList.append(0)
newList.append(1)
newList.to_s
newList.append(2)
newList.append(3)
newList.append('REMOVE me')
newList.insert_at('Im the thing',4)
newList.to_s

newList.remove_at(4)
newList.to_s