#
# @lc app=leetcode id=641 lang=ruby
#
# [1021] Remove Outermost Parentheses
#

# @lc code=start
class MyCircularDeque

  attr_reader :elements, :front_index, :last_index, :size
=begin
    Initialize your data structure here. Set the size of the deque to be k.
    :type k: Integer
=end
  def initialize(k)
    # We have to initialize an array with size of k+1, there is 1 element that
    # will never be used.
    @elements = Array.new(k + 1, nil)
    @front_index = 0
    @last_index = 0
    @size = k + 1
  end


=begin
    Adds an item at the front of Deque. Return true if the operation is successful.
    :type value: Integer
    :rtype: Boolean
=end
  def insert_front(value)
    return false if is_full

    elements[front_index] = value
    @front_index = (front_index - 1 + size) % size
    true
  end


=begin
    Adds an item at the rear of Deque. Return true if the operation is successful.
    :type value: Integer
    :rtype: Boolean
=end
  def insert_last(value)
    return false if is_full

    @last_index = (last_index + 1) % size
    elements[last_index] = value
    true
  end


=begin
    Deletes an item from the front of Deque. Return true if the operation is successful.
    :rtype: Boolean
=end
  def delete_front()
    return false if is_empty

    elements[actual_front_index] = nil
    @front_index = actual_front_index
    true
  end


=begin
    Deletes an item from the rear of Deque. Return true if the operation is successful.
    :rtype: Boolean
=end
  def delete_last()
    return false if is_empty

    elements[last_index] = nil
    @last_index = (last_index - 1 + size) % size
    true
  end


=begin
    Get the front item from the deque.
    :rtype: Integer
=end
  def get_front()
    return -1 if is_empty

    elements[actual_front_index]
  end


=begin
    Get the last item from the deque.
    :rtype: Integer
=end
  def get_rear()
    return -1 if is_empty

    elements[last_index]
  end


=begin
    Checks whether the circular deque is empty or not.
    :rtype: Boolean
=end
  def is_empty()
    return true if size == 0

    front_index == last_index
  end


=begin
    Checks whether the circular deque is full or not.
    :rtype: Boolean
=end
  def is_full()
    return true if size == 0

    (last_index + 1) % size == front_index
  end

  private

  def actual_front_index
    (front_index + 1) % size
  end
end

# Your MyCircularDeque object will be instantiated and called as such:
# obj = MyCircularDeque.new(k)
# param_1 = obj.insert_front(value)
# param_2 = obj.insert_last(value)
# param_3 = obj.delete_front()
# param_4 = obj.delete_last()
# param_5 = obj.get_front()
# param_6 = obj.get_rear()
# param_7 = obj.is_empty()
# param_8 = obj.is_full()

# @lc code=end
