module LinkedList
    class List
        attr_accessor :head, :tail


        include Enumerable
        def each
            return nil if @head.nil?
            entry = @head
            until entry.nil?
                yield entry
                entry = entry.next
            end
        end

        def initialize
            @head = nil
            @tail = nil
        end

        def put_at_top(node)
            if @head.nil?
                @head = node
                @tail = node
            else
                node.next = @head
                @head = node
            end
        end

        def put_at_bottom(node)
            if @head.nil?
                @head = node
                @tail = node
            else
                @tail.next = node
                @tail = node
            end
        end

        def remove_from_top
            return nil if @head.nil?
            node = @head
            @head = @head.next
            return node
        end

        def reverse!
            return nil if @head.nil?

            @temp_head = self.remove_from_top
            @temp_head.next = nil
            @tail = @temp_head

            until @head.nil?
                node = remove_from_top
                node.next = @temp_head
                @temp_head = node
            end

            @head = @temp_head
        end

        def reverse
            new_list = List.new
            self.each{|node| new_list.put_at_top(Node.new(node.value))}
            new_list
        end
    end

    class Node
        attr_reader :value
        attr_accessor :next
        attr_reader :head

        def initialize(value)
            @value = value
            @next = nil
        end

    end


end

include LinkedList

list_try = List.new
head_node = Node.new('I am the head')
second_node = Node.new('I am the second node')
tail_node = Node.new('I am the tail node')

list_try.put_at_bottom(head_node)
list_try.put_at_bottom(second_node)
list_try.put_at_bottom(tail_node)


# puts list_try.head
# puts list_try.tail

puts " Head Node : #{list_try.head.value} --> Second Node : #{list_try.head.next.value} --> Tail Node : #{list_try.tail.value}"
reverse_list = list_try.reverse
puts "Reversed list"
puts " Head Node : #{list_try.head.value} --> Second Node : #{list_try.head.next.value} --> Tail Node : #{list_try.tail.value}"


