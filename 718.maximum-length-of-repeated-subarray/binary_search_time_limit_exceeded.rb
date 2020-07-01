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
  a, b = b, a if a.size > b.size

  lo = 0
  hi = a.size + 1

  while lo < hi
    mi = (lo + hi) / 2

    if check(a, b, mi)
      lo = mi + 1
    else
      hi = mi
    end
  end

  lo - 1
end

def check(a, b, len)
  return false if len > a.size

  a_set = (0..a.size-len).each_with_object({}) do |i, memo|
    memo[a[i,len]] = i
  end

  (0..b.size-len).each do |j|
    return true if a_set[b[j, len]]
  end

  false
end
# @lc code=end

