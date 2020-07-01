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
    memo <<
      case
      when i % 3 == 0 && i % 5 == 0
        'FizzBuzz'
      when i % 3 == 0
        'Fizz'
      when i % 5 == 0
        'Buzz'
      else
        i.to_s
      end
  end
end
# @lc code=end

