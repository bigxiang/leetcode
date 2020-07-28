#
# @lc app=leetcode id=322 lang=ruby
#
# [322] Coin Change
#

# @lc code=start
# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  dp = Array.new(amount + 1, Float::INFINITY)
  dp[0] = 0

  (1..amount).each do |n|
    dp[n] = coins.map { |coin| (n>=coin ? dp[n-coin] : Float::INFINITY) }.min + 1
  end

  dp[-1] == Float::INFINITY ? -1 : dp[-1]
end
# @lc code=end

puts coin_change([2, 3, 5], 1)
puts coin_change([2, 3, 5], 11)
puts coin_change([1, 2, 5], 11)
puts coin_change([2, 3, 5], 9)
puts coin_change([2], 3)
