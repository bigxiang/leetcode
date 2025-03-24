#
# @lc app=leetcode.cn id=2610 lang=ruby
# @lcpr version=30204
#
# [2610] 转换二维数组
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def find_matrix(nums)
  result = []
  nums_count = nums.each_with_object(Hash.new(0)) { |num, hash| hash[num] += 1 }

  while nums_count.any?
    row = []
    nums_count.keys.each do |num|
      row << num
      nums_count[num] -= 1
      nums_count.delete(num) if nums_count[num] == 0
    end
    result << row
  end

  result
end
# @lc code=end



#
# @lcpr case=start
# [1,3,4,1,2,3,1]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4]\n
# @lcpr case=end

# @lcpr case=start
# [1]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5,6,7,8,9,10,1,2,2,5,6,8]\n
# @lcpr case=end

#

