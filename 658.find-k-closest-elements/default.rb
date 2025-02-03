#
# @lc app=leetcode.cn id=658 lang=ruby
# @lcpr version=30204
#
# [658] 找到 K 个最接近的元素
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} arr
# @param {Integer} k
# @param {Integer} x
# @return {Integer[]}
def find_closest_elements(arr, k, x)
  start_index = find_closest_index(arr, x)
  result = [arr[start_index]]
  left = start_index - 1
  right = start_index + 1
  while result.size < k
    if right >= arr.length || left >= 0 && arr[right] - x >= x - arr[left]
      result.unshift(arr[left])
      left -= 1
    else
      result.push(arr[right])
      right += 1
    end
  end
  result
end

def find_closest_index(arr, x)
  return 0 if x <= arr[0]
  return arr.length - 1 if x >= arr[-1]

  left = 0
  right = arr.length - 1
  while left < right
    mid = left + (right - left) / 2
    return mid if arr[mid] == x

    if arr[mid] < x
      left = mid + 1
    else
      right = mid
    end
  end

  if arr[left] - x < x - arr[left - 1]
    left
  else
    left - 1
  end
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3,4,5]\n4\n3\n
# @lcpr case=end

# @lcpr case=start
# [1,1,2,3,4,5]\n4\n-1\n
# @lcpr case=end

# @lcpr case=start
# [1,1,2,3,4,5,5]\n4\n5\n
# @lcpr case=end

# @lcpr case=start
# [-5,-5,-4,-3,-2,-2,-1,1,1,2,3,4,5,5]\n5\n0\n
# @lcpr case=end

#
