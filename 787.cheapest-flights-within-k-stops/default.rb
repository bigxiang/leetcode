#
# @lc app=leetcode.cn id=787 lang=ruby
# @lcpr version=30204
#
# [787] K 站中转内最便宜的航班
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer} n
# @param {Integer[][]} flights
# @param {Integer} src
# @param {Integer} dst
# @param {Integer} k
# @return {Integer}
def find_cheapest_price(n, flights, src, dst, k)
  dp = Array.new(k + 2) { Array.new(n, Float::INFINITY) }
  dp[0][src] = 0
  (1...k + 2).each do |i|
    flights.each do |(from, to, price)|
      dp[i][to] = [dp[i - 1][from] + price, dp[i][to]].min
    end
  end

  min_price = dp.map { |t| t[dst] }.min
  min_price == Float::INFINITY ? -1 : min_price
end
# @lc code=end

#
# @lcpr case=start
# 4\n[[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]]\n0\n3\n1\n
# @lcpr case=end

# @lcpr case=start
# 3\n[[0,1,100],[1,2,100],[0,2,500]]\n0\n2\n1\n
# @lcpr case=end

# @lcpr case=start
# 3\n[[0,1,100],[1,2,100],[0,2,500]]\n0\n2\n0\n
# @lcpr case=end

# @lcpr case=start
# 3\n[[0,1,100],[0,2,500]]\n1\n2\n1\n
# @lcpr case=end

# @lcpr case=start
# 2\n[[0,1,100]]\n0\n1\n0\n
# @lcpr case=end

#
