#
# @lc app=leetcode id=860 lang=ruby
#
# [860] Lemonade Change
#

# @lc code=start
# @param {Integer[]} bills
# @return {Boolean}
def lemonade_change(bills)
  on_hand = Hash.new(0)

  bills.each do |amount|
    need_to_change = amount - 5

    while need_to_change > 0
      [10, 5, nil].each do |change|
        return false if change.nil?
        next if change > need_to_change || on_hand[change] == 0

        on_hand[change] -= 1
        need_to_change -= change
        break
      end
    end

    on_hand[amount] += 1
  end

  true
end
# @lc code=end

