#
# @lc app=leetcode id=860 lang=ruby
#
# [860] Lemonade Change
#

# @lc code=start
# @param {Integer[]} bills
# @return {Boolean}
def lemonade_change(bills)
  five_count = 0
  ten_count = 0

  bills.each do |amount|
    case amount
    when 5
      five_count += 1
    when 10
      five_count -= 1
      ten_count += 1
    when 20
      if ten_count > 0
        ten_count -= 1
        five_count -= 1
      else
        five_count -= 3
      end
    end

    return false if five_count < 0
  end

  true
end
# @lc code=end

