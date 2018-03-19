
class LinkedList
  def initialize
    @head = Node.new
    @size = 0
  end
# value: nil, next: nil
# value: 1, next: (value, next)
  public
    def append data
      if @head.value == nil
        fill_empty_head(data)
      else
        current_node = @head
        until current_node.next_node.nil?
          current_node = current_node.next_node
        end
        current_node.value = data
        current_node.next_node = Node.new
        @size += 1
      end
    end

    def pop
      if @head.value == nil
        return
      elsif @head.next_node.value == nil
        @head = Node.new
        @size -= 1
      else
        current_node = @head
        until current_node.next_node.next_node.next_node.nil?
          current_node = current_node.next_node
        end
        current_node.next_node = Node.new
        @size -= 1
      end
    end

    def contains? data
      current_node = @head
      until current_node.next_node.nil?
        return true if current_node.value == data
        current_node = current_node.next_node
      end
      return false
    end

    def find data
      current_node = @head
      current_index = 0
      until current_node.next_node.nil?
        return current_index if current_node.value == data
        current_node = current_node.next_node
        current_index += 1
      end
      return "Data not found"
    end

    def to_s
      current_node = @head
      until current_node.next_node.nil?
        print " (#{current_node.value}) ->"
        current_node = current_node.next_node
      end
      print " nil "
      puts ""
    end

    def prepend data
      if @head.value == nil
        fill_empty_head(data)
      else
        current_node = Node.new
        current_node.next_node = @head
        current_node.value = data
        @head = current_node
        @size += 1
      end
    end

    def size
      @size
    end

    def head
      @head
    end

    def tail
      return @head if @head.next_node == nil
      current_node = @head
      until current_node.next_node.next_node.nil?
        current_node = current_node.next_node
      end
      current_node
    end

    def at index
      current_node = @head
      current_index = 0
      while current_index < index do
        if !current_node.next_node.nil?
          current_node = current_node.next_node
          current_index += 1
        else
          return "Index at #{index} does not exist"
          break
        end
      end
      current_node
    end

  private
    def fill_empty_head data
        @head.value = data
        @head.next_node = Node.new
        @size += 1
    end
end

class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end
