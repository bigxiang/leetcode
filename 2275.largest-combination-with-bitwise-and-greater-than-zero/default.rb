#
# @lc app=leetcode.cn id=2275 lang=ruby
# @lcpr version=30204
#
# [2275] 按位与结果大于零的最长组合
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} candidates
# @return {Integer}
def largest_combination(candidates)
  bits = Array.new(Math.log2(1e7).ceil, 0)
  candidates.each do |num|
    (0...bits.size).each do |i|
      bits[i] += (num >> i) & 1
    end
  end
  bits.max
end
# @lc code=end

#
# @lcpr case=start
# [16,17,71,62,12,24,14]\n
# @lcpr case=end

# @lcpr case=start
# [8,8]\n
# @lcpr case=end

#
