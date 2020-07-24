#
# @lc app=leetcode id=1025 lang=ruby
#
# [1025] Divisor Game
#

# @lc code=start
# @param {Integer} n
# @return {Boolean}
def divisor_game(n)
  result = Array.new(n+1, false)
  result[1] = false
  result[2] = true

  (3..n).each do |i|
    (1..i/2).each do |divisor|
      if i % divisor == 0 && !result[i - divisor]
        result[i] = true
        break
      end
    end
  end

  result[n]
end
# @lc code=end
