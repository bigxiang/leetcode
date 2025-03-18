#
# @lc app=leetcode.cn id=3340 lang=ruby
# @lcpr version=30204
#
# [3340] 检查平衡字符串
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} num
# @return {Boolean}
def is_balanced(num)
  odd_sum = 0
  even_sum = 0
  (0...num.length).each do |i|
    i % 2 == 0 ? even_sum += num[i].to_i : odd_sum += num[i].to_i
  end
  odd_sum == even_sum
end
# @lc code=end



#
# @lcpr case=start
# "1234"\n
# @lcpr case=end

# @lcpr case=start
# "24123"\n
# @lcpr case=end

#

