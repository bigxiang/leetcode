#
# @lc app=leetcode id=146 lang=ruby
#
# [146] LRU Cache
#

# @lc code=start
class LRUCache
    attr_reader :capacity, :cache, :head, :tail

    class ListNode
      attr_accessor :prev, :next, :key, :value
    end

=begin
    :type capacity: Integer
=end
    def initialize(capacity)
      @capacity = capacity
      @head = ListNode.new
      @tail = ListNode.new
      @head.next = @tail
      @tail.prev = @head
      @cache = {}
    end


=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
      return -1 if !cache.key?(key)

      node = cache[key]
      move_to_head(node)
      node.value
    end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
      if cache.key?(key)
        node = cache[key]
        node.value = value
        move_to_head(node)
      else
        node = build_new_node(key, value)
        delete(tail.prev) if full?
        add_after_head(node)
      end
    end

    private

    def move_to_head(node)
      delete(node) && add_after_head(node)
    end

    def empty?
      size == 0
    end

    def full?
      size == capacity
    end

    def size
      cache.size
    end

    def delete(node)
      return false if empty?

      node.prev.next = node.next
      node.next.prev = node.prev
      cache.delete(node.key)
    end

    def add_after_head(node)
      node.next = head.next
      head.next.prev = node
      head.next = node
      node.prev = head
      cache[node.key] = node
    end

    def build_new_node(key, value)
      node = ListNode.new
      node.key = key
      node.value = value
      node
    end
end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
# @lc code=end
