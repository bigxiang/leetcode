#
# @lc app=leetcode.cn id=1343 lang=ruby
# @lcpr version=30204
#
# [1343] 大小为 K 且平均值大于等于阈值的子数组数目
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} arr
# @param {Integer} k
# @param {Integer} threshold
# @return {Integer}
def num_of_subarrays(arr, k, threshold)
  ans = 0
  avg = 0
  (0..arr.size - 1).each do |i|
    avg += arr[i].to_f / k
    next if i < k - 1

    ans += 1 if avg >= threshold
    avg -= arr[i - k + 1].to_f / k
  end
  ans
end
# @lc code=end

#
# @lcpr case=start
# [2,2,2,2,5,5,5,8]\n3\n4\n
# @lcpr case=end

# @lcpr case=start
# [11,13,17,23,29,31,7,5,2,3]\n3\n5\n
# @lcpr case=end

#
