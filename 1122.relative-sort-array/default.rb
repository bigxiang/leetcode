#
# @lc app=leetcode id=1122 lang=ruby
#
# [1122] Relative Sort Array
#

# @lc code=start
# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer[]}
def relative_sort_array(arr1, arr2)
  counting = Array.new(1001, 0)
  arr1.each do |n|
    counting[n] += 1
  end

  new_arr1 = []
  arr2.each do |n|
    while counting[n] > 0
      new_arr1 << n
      counting[n] -= 1
    end
  end

  (0..counting.size-1).each do |i|
    while counting[i] > 0
      new_arr1 << i
      counting[i] -= 1
    end
  end

  new_arr1
end
# @lc code=end

