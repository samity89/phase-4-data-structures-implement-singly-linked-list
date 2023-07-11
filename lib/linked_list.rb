require_relative './node'

class LinkedList
    attr_accessor :head, :tail, :length
  
    def initialize
        @head = nil
        @tail = nil
        @length = 0
    end

    def prepend(node)
        head.nil? ? (
            @head = node
            @tail = node
            @length += 1
        ) : (
            old_first_node = head
            @head = node
            @head.next_node = old_first_node
            @length +=1
        )
    end

    def append(node)
        head.nil? ? (
            @head = node
            @tail = node
            @length += 1
        ) : (
            @tail.next_node = node
            @tail = node
            @length += 1
        )
    end

    def delete_head
        length == 0 ? nil : (
            new_head = head.next_node
            @head = new_head
            @length -= 1
        )
    end

    def delete_tail
        if length == 0 
            nil
        elsif length == 1
            @head = nil
            @tail = nil
            @length -= 1
        else
            node = @head
            old_tail = @tail
            if node.next_node.next_node == old_tail
               @tail = node.next_node
               @tail.next_node = nil
               @length -= 1
            end
        end
    end

    def add_after(index, node)
        current = @head
        new_node = node
        index == length ? (
            (index - 1).times do
                current = current.next_node
            end
            current.next_node = new_node
            new_node.next_node = nil
        ) : (
            index.times do
                current = current.next_node
            end
            new_node.next_node = current.next_node
            current.next_node = new_node
        )         
    end

    def search(value)
        node = @head
        return false if !node.next_node
        return node if node.data == value
        while (node = node.next_node)
            return node if node.data == value
        end
    end
           
end