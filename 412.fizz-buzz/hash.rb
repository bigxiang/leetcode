#
# @lc app=leetcode id=412 lang=ruby
#
# [412] Fizz Buzz
#

# @lc code=start
# @param {Integer} n
# @return {String[]}
STRING_PATTERNS = {
  3 => 'Fizz',
  5 => 'Buzz'
}

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  (1..n).each_with_object([]) do |i, memo|
    memo << build_string(i)
  end
end

def build_string(i)
  str = ''
  STRING_PATTERNS.each { |k, v| str += i % k == 0 ? v : '' }
  str = i.to_s if str.empty?
  str
end
# @lc code=end

