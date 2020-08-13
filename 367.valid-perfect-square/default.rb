#
# @lc app=leetcode id=367 lang=ruby
#
# [367] Valid Perfect Square
#

# @lc code=start
# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)
  lo = 1
  hi = num
  while lo <= hi
    mid = lo + ((hi - lo) >> 1)
    square = mid ** 2
    if num == square
      return true
    elsif num < square
      hi = mid - 1
    elsif num > square
      lo = mid + 1
    end
  end
  false
end
# @lc code=end

puts is_perfect_square(16)
