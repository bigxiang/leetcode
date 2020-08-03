#
# @lc app=leetcode id=91 lang=ruby
#
# [91] Decode Ways
#

# @lc code=start
# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.nil? || s.empty?
  return 0 if s[0] == '0'

  dp = Array.new(s.length + 1, 0)
  dp[0] = 1
  dp[1] = 1
  (2..s.length).each do |i|
    dp[i] += dp[i-1] if s[i-1] != '0'
    dp[i] += dp[i-2] if s[i-2..i-1].to_i <= 26 && s[i-2..i-1].to_i >= 10
  end

  dp[-1]
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
