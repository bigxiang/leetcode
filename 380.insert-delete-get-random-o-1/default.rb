#
# @lc app=leetcode.cn id=380 lang=ruby
# @lcpr version=30204
#
# [380] O(1) 时间插入、删除和获取随机元素
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
class RandomizedSet
  attr_reader :data, :keys

  def initialize
    @data = []
    @keys = {}
  end

  #     :type val: Integer
  #     :rtype: Boolean
  def insert(val)
    return false if keys[val]

    data.push(val)
    keys[val] = data.size - 1
    true
  end

  #     :type val: Integer
  #     :rtype: Boolean
  def remove(val)
    return false unless keys[val]

    index = keys[val]
    data[index], data[data.size - 1] = data[data.size - 1], data[index]
    data.pop
    keys.delete(val)
    keys[data[index]] = index
    true
  end

  #     :rtype: Integer
  def get_random
    data.sample
  end
end

# Your RandomizedSet object will be instantiated and called as such:
# obj = RandomizedSet.new()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.get_random()
# @lc code=end
