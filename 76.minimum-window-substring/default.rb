#
# @lc app=leetcode id=76 lang=ruby
#
# [76] Minimum Window Substring
#

# @lc code=start
# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  return '' if s.nil? || t.nil? || s.empty? || t.empty?

  dict_t = t.chars.each_with_object(Hash.new(0)) do |c, memo|
    memo[c] += 1
  end

  required = dict_t.size
  formed = 0
  l = 0
  r = 0
  dict_window = Hash.new(0)
  result = [-1, l, r]

  filtered_s = s.chars.each_with_index.each_with_object([]) do |(c, i), memo|
    next if !dict_t.key?(c)

    memo << [i, c]
  end

  while r < filtered_s.size
    idx, c = filtered_s[r]
    dict_window[c] += 1
    if dict_window[c] == dict_t[c]
      formed += 1
    end

    while l <= r && formed == required
      c = filtered_s[l][1]
      start_i = filtered_s[l][0]
      end_i = filtered_s[r][0]

      if result[0] == -1 || end_i - start_i < result[0]
        result = [end_i - start_i, start_i, end_i]
      end

      dict_window[c] -= 1

      if dict_window[c] < dict_t[c]
        formed -= 1
      end

      l += 1
    end

    r += 1
  end


  result[0] == -1 ? '' : s[result[1]..result[2]]
end
# @lc code=end

puts min_window('ADOBECODEBANC', 'ABC')
