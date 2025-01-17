#
# @lc app=leetcode.cn id=155 lang=ruby
# @lcpr version=30204
#
# [155] 最小栈
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
class MinStack
  attr_reader :data

  def initialize
    @data = []
  end

  #     :type val: Integer
  #     :rtype: Void
  def push(val)
    min = data.empty? ? val : [val, data.last[1]].min
    data.push([val, min])
  end

  #     :rtype: Void
  def pop
    data.pop
  end

  #     :rtype: Integer
  def top
    data.last[0]
  end

  #     :rtype: Integer
  def get_min
    data.last[1]
  end
end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()
# @lc code=end

#
# @lcpr case=start
# ["MinStack","push","push","push","getMin","pop","top","getMin"]\n[[],[-2],[0],[-3],[],[],[],[]]\n
# @lcpr case=end

# @lcpr case=start
# ["MinStack","push","push","push","top","pop","getMin","pop","getMin","pop","push","top","getMin","push","top","getMin","pop","getMin"]\n[[],[2147483646],[2147483646],[2147483647],[],[],[],[],[],[],[2147483647],[],[],[-2147483648],[],[],[],[]]\n
# @lcpr case=end

#
