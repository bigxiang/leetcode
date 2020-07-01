#
# @lc app=leetcode id=412 lang=ruby
#
# [412] Fizz Buzz
#

# @lc code=start
# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  (1..n).each_with_object([]) do |i, memo|
    memo << build_string(i)
  end
end

def build_string(i)
  str = ''
  str += 'Fizz' if i % 3 == 0
  str += 'Buzz' if i % 5 == 0
  str = i.to_s if str == ''
  str
end
# @lc code=end

