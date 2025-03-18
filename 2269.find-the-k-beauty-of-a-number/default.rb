#
# @lc app=leetcode.cn id=2269 lang=ruby
# @lcpr version=30204
#
# [2269] 找到一个数字的 K 美丽值
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer} num
# @param {Integer} k
# @return {Integer}
def divisor_substrings(num, k)
  count = 0
  digits = Math.log10(num).to_i + 1
  (0..digits - k).each do |i|
    pre_divisor = 10**(digits - i)
    suf_divisor = 10**(digits - k - i)

    divisor = (num % pre_divisor) / suf_divisor
    next if divisor.zero?

    count += 1 if num % divisor == 0
  end

  count
end
# @lc code=end



#
# @lcpr case=start
# 240\n2\n
# @lcpr case=end

# @lcpr case=start
# 430043\n2\n
# @lcpr case=end

# @lcpr case=start
# 12211213\n1\n
# @lcpr case=end

# @lcpr case=start
# 12211213\n5\n
# @lcpr case=end

# @lcpr case=start
# 10\n1\n
# @lcpr case=end

# @lcpr case=start
# 100000\n2\n
# @lcpr case=end

#

