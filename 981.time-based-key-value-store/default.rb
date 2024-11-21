#
# @lc app=leetcode.cn id=981 lang=ruby
# @lcpr version=30204
#
# [981] 基于时间的键值存储
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
class TimeMap
  attr_accessor :data

  def initialize
    @data = {}
  end

  #     :type key: String
  #     :type value: String
  #     :type timestamp: Integer
  #     :rtype: Void
  def set(key, value, timestamp)
    data[key] ||= []
    data[key] << [timestamp, value]
  end

  #     :type key: String
  #     :type timestamp: Integer
  #     :rtype: String
  def get(key, timestamp)
    return '' if data[key].nil?

    values = data[key]
    left = 0
    right = values.size - 1
    while left <= right
      mid = left + (right - left) / 2
      if values[mid][0] == timestamp
        return values[mid][1]
      elsif values[mid][0] < timestamp
        left = mid + 1
      else
        right = mid - 1
      end
    end

    left.positive? ? values[left - 1][1] : ''
  end
end

# Your TimeMap object will be instantiated and called as such:
# obj = TimeMap.new()
# obj.set(key, value, timestamp)
# param_2 = obj.get(key, timestamp)
# @lc code=end

#
# @lcpr case=start
# ["TimeMap", "set", "get", "get", "set", "get", "get"]\n[[], ["foo", "bar", 1], ["foo", 1], ["foo", 3], ["foo", "bar2", 4], ["foo", 4], ["foo", 5]]\n
# @lcpr case=end

#
