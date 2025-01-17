#
# @lc app=leetcode.cn id=739 lang=ruby
# @lcpr version=30204
#
# [739] 每日温度
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  result = Array.new(temperatures.size, 0)
  stack = []
  (temperatures.size - 1).downto(0) do |i|
    while stack.any?
      if temperatures[i] >= temperatures[stack.last]
        stack.pop
      else
        result[i] = stack.last - i
        stack.push(i)
        break
      end
    end

    stack.push(i)
  end
  result
end
# @lc code=end

#
# @lcpr case=start
# [73,74,75,71,69,72,76,73]\n
# @lcpr case=end

# @lcpr case=start
# [30,40,50,60]\n
# @lcpr case=end

# @lcpr case=start
# [30,60,90]\n
# @lcpr case=end

# @lcpr case=start
# [90]\n
# @lcpr case=end

#
