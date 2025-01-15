#
# @lc app=leetcode id=146 lang=ruby
#
# [146] LRU Cache
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
class LRUCache
  class ListNode
    attr_accessor :next, :prev, :key, :val

    def initialize(key, val)
      @key = key
      @val = val
    end
  end

  attr_reader :capacity, :size, :head, :tail, :cache

  #     :type capacity: Integer
  def initialize(capacity)
    @capacity = capacity
    @size = 0
    @cache = {}
    @head = ListNode.new(-1, -1)
    @tail = ListNode.new(-1, -1)
    @head.next = @tail
    @tail.prev = @head
  end

  #     :type key: Integer
  #     :rtype: Integer
  def get(key)
    return -1 unless cache[key]

    move_to_tail(key)
    cache[key].val
  end

  #     :type key: Integer
  #     :type value: Integer
  #     :rtype: Void
  def put(key, value)
    if cache[key]
      cache[key].val = value

      move_to_tail(key)
    else
      node = ListNode.new(key, value)
      cache[key] = node

      if size == capacity
        remove_head
      else
        @size += 1
      end

      add_to_tail(node)
    end
  end

  private

  def move_to_tail(key)
    node = cache[key]
    prev = node.prev
    nxt = node.next
    prev.next = nxt
    nxt.prev = prev

    add_to_tail(node)
  end

  def add_to_tail(node)
    node.prev = tail.prev
    node.next = tail
    tail.prev.next = node
    tail.prev = node
  end

  def remove_head
    cache.delete(head.next.key)
    head.next = head.next.next
    head.next.prev = head
  end
end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
# @lc code=end

# @lcpr case=start
# ["LRUCache","put","put","put","put","get","get"]\n[[2],[2,1],[1,1],[2,3],[4,1],[1],[2]]\n
# @lcpr case=end
