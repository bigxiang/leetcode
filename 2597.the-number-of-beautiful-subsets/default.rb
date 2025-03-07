#
# @lc app=leetcode.cn id=2597 lang=ruby
# @lcpr version=30204
#
# [2597] 美丽子集的数目
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def beautiful_subsets(nums, k)
  cache = Array.new(nums.length) { Array.new(nums.length, false) }
  (0...nums.length).each do |i|
    cache[i][i] = true
    (i+1...nums.length).each do |j|
      next if (nums[i] - nums[j]).abs != k

      cache[i][j] = true
      cache[j][i] = true
    end
  end

  # puts "cache: #{cache}"

  dfs(nums, 0, [], cache, 0)
end

def dfs(nums, i, path, cache, result)
  return result if i == nums.length

  result = dfs(nums, i + 1, path, cache, result)

  beautiful = true
  path.each do |j|
    next unless cache[i][j]

    beautiful = false
    break
  end

  return result unless beautiful

  # puts "result: #{result}, path: #{path}, i: #{i}, beautiful: #{beautiful}"
  dfs(nums, i + 1, path + [i], cache, result + 1)
end
# @lc code=end



#
# @lcpr case=start
# [2,4,6]\n2\n
# @lcpr case=end

# @lcpr case=start
# [1]\n1\n
# @lcpr case=end

# @lcpr case=start
# [1,1,1,5,2,4,1,3]\n1\n
# @lcpr case=end

# @lcpr case=start
# [1,1,1,1,2,3,4,5]\n1\n
# @lcpr case=end

# @lcpr case=start
# [1,1,1,1,2,3,4,5,557,322,135,356,320,1000,123,35,54]\n85\n
# @lcpr case=end

# @lcpr case=start
# [10,4,5,7,2,1]\n3\n
# @lcpr case=end

# @lcpr case=start
# [10,4,4,5,7,7,7,2,1,11,13,15,17,18,19,20,22,23]\n3\n
# @lcpr case=end

# @lcpr case=start
# [5,4,2,1]\n3\n
# @lcpr case=end

# @lcpr case=start
# [10,4,4,5,2,7,7,7,1,11,13]\n3\n
# @lcpr case=end

# @lcpr case=start
# [10,4,4,5,2,7,1,8,9]\n3\n
# @lcpr case=end

#

