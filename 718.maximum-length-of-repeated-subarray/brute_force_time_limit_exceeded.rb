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

  a_index_map = {}
  a.each_with_index do |m, i|
    a_index_map[m] ||= []
    a_index_map[m] << i
  end

  b.each_with_index do |m, i|
    next unless a_index_map.key?(m)

    a_index_map[m].each do |j|
      k = 1
      while i+k < b.size && j+k < a.size && a[j+k] == b[i+k]
        k += 1
      end
      max = k > max ? k : max
    end
  end

  max
end
# @lc code=end

