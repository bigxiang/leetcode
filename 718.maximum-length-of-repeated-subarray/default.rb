#
# @lc app=leetcode id=718 lang=ruby
#
# [718] Maximum Length of Repeated Subarray
#

# @lc code=start
# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer}
def find_length(a, b)
  max = 0

  a, b = b, a if a.size < b.size

  (-b.size+1..a.size+b.size-1).each do |i|
    count = 0

    (0..b.size-1).each do |j|
      pointer_a = i+j

      next if pointer_a < 0
      break if pointer_a > a.size-1

      if a[pointer_a] == b[j]
        count += 1
        max = count > max ? count : max
      else
        count = 0
      end
    end
  end

  max
end
# @lc code=end

