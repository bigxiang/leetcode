#
# @lc app=leetcode id=70 lang=ruby
#
# [70] Climbing Stairs
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  calc_steps(n)
end

def calc_steps(n, calculated = {})
  return n if n <= 2
  return calculated[n] if calculated.key?(n)

  steps = calc_steps(n-1, calculated) + calc_steps(n-2, calculated)
  calculated[n] = steps
  steps
end
# @lc code=end

