#
# @lc app=leetcode id=91 lang=ruby
#
# [91] Decode Ways
#

# @lc code=start
# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.nil? || s.length == 0

  dp = Array.new(s.length + 1, 0).tap { |a| a[0] = 1 }

  s.length.times do |i|
    dp[i+1] = dp[i-1] if i > 0 && s[i-1,2].to_i <= 26 && s[i-1,2].to_i >= 10
    dp[i+1] += dp[i] if s[i] != '0'
  end

  dp[s.length]
end
# @lc code=end

puts num_decodings('226') == 3
puts num_decodings('12') == 2
puts num_decodings('2') == 1
puts num_decodings(nil) == 0
puts num_decodings('') == 0
puts num_decodings('0') == 0
puts num_decodings('01') == 0
puts num_decodings('10') == 1
puts num_decodings('20') == 1
puts num_decodings('120') == 1
puts num_decodings('30') == 0
puts num_decodings('100') == 0
puts num_decodings('101') == 1
puts num_decodings('1210') == 2
puts num_decodings('121024') == 4
puts num_decodings('123024') == 0
puts num_decodings('17') == 2
puts num_decodings('121') == 3
puts num_decodings('1212') == 5
