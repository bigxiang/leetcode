#
# @lc app=leetcode.cn id=232 lang=ruby
# @lcpr version=30204
#
# [232] 用栈实现队列
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
class MyQueue
  attr_reader :stack1, :stack2

  def initialize
    @stack1 = []
    @stack2 = []
  end

  #     :type x: Integer
  #     :rtype: Void
  def push(x)
    move_from_stack2_to_stack1
    stack1.push(x)
  end

  #     :rtype: Integer
  def pop
    move_from_stack1_to_stack2
    stack2.pop
  end

  #     :rtype: Integer
  def peek
    move_from_stack1_to_stack2
    stack2.last
  end

  #     :rtype: Boolean
  def empty
    stack1.empty? && stack2.empty?
  end

  private

  def move_from_stack1_to_stack2
    stack2.push(stack1.pop) while stack1.any?
  end

  def move_from_stack2_to_stack1
    stack1.push(stack2.pop) while stack2.any?
  end
end

# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()
# @lc code=end

#
# @lcpr case=start
# ["MyQueue", "push", "push", "peek", "pop", "empty"]\n[[], [1], [2], [], [], []]\n
# @lcpr case=end

#
