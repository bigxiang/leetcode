require 'pp'
#
# @lc app=leetcode id=493 lang=ruby
#
# [493] Reverse Pairs
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def reverse_pairs(nums)
  @count = 0
  merge_sort(nums, 0, nums.size-1)
  @count
end

def merge_sort(nums, lo, hi)
  return if lo >= hi

  mid = lo + (hi - lo) / 2
  merge_sort(nums, lo, mid)
  merge_sort(nums, mid+1, hi)

  temp = []
  left = lo
  pair_index = lo
  right = mid+1

  while right <= hi
    while left <= mid && nums[left] <= nums[right]
      temp << nums[left]
      left += 1
    end

    temp << nums[right]

    while pair_index <= mid && ((nums[pair_index] + 1) >> 1) <= nums[right]
      pair_index += 1
    end

    @count += mid - pair_index + 1
    right += 1
  end

  nums[left..mid].each { |n| temp << n }
  (lo..hi).each { |i| nums[i] = temp[i - lo] }
end
# @lc code=end

puts reverse_pairs [1,3,2,3,1]
puts reverse_pairs [2,4,3,5,1]
