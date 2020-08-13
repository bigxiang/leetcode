#
# @lc app=leetcode id=146 lang=ruby
#
# [146] LRU Cache
#

# @lc code=start
class LRUCache
    class DoubleLinkedList
        attr_accessor :head, :tail, :size

        def initialize
            @head = ListNode.new
            @tail = ListNode.new
            head.next = tail
            tail.prev = head
            @size = 0
        end

        def empty?
            head.next == tail
        end

        def add(new_node, node = head)
            node.next.prev = new_node
            new_node.next = node.next
            node.next = new_node
            new_node.prev = node
            @size += 1
        end

        def delete(node)
            return if empty?

            prev_node = node.prev
            prev_node.next = node.next
            node.next.prev = prev_node
            @size -= 1
            node
        end

        def delete_last
            delete(tail.prev)
        end
    end

    class ListNode
        attr_accessor :key, :val, :prev, :next

        def initialize(key = nil, val = nil)
            @key = key
            @val = val
        end
    end

    attr_reader :cache, :capacity, :cache_list
=begin
    :type capacity: Integer
=end
    def initialize(capacity)
        @capacity = capacity
        @cache = {}
        @cache_list = DoubleLinkedList.new
    end


=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
        return -1 if !cache.has_key?(key)

        node = cache[key]
        move_to_head(node)
        node.val
    end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
        if node = cache[key]
            node.val = value
            move_to_head(node)
        else
            delete_last if full?
            node = ListNode.new(key, value)
            cache[key] = node
            cache_list.add(node)
        end
    end

    private

    def full?
        cache_list.size == capacity
    end

    def move_to_head(node)
        cache_list.delete(node)
        cache_list.add(node)
    end

    def delete_last
        node = cache_list.delete_last
        cache.delete(node.key)
    end
end


# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
# @lc code=end

