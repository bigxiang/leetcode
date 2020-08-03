require 'set'
#
# @lc app=leetcode id=403 lang=ruby
#
# [403] Frog Jump
#

# @lc code=start
# @param {Integer[]} stones
# @return {Boolean}
def can_cross(stones)
  return false if stones[1] != 1

  stones_map = stones.each_with_index.each_with_object({}) do |(p, i), memo|
    memo[p] = i
  end

  dp = Array.new(stones.size, nil)
  dp[1] = Set.new([1])
  (1..stones.size-1).each do |i|
    next if dp[i].nil?

    dp[i].each do |steps|
      [-1, 0, 1].each do |mod|
        next if steps + mod <= 0

        can_jump_to_stone_pos = stones_map[steps + mod + stones[i]]
        if can_jump_to_stone_pos
          dp[can_jump_to_stone_pos] ||= Set.new
          dp[can_jump_to_stone_pos] << steps + mod
        end
      end
    end
  end

  # require 'pp'
  # pp dp
  !dp[-1].nil?
end
# @lc code=end

puts can_cross([0,1,3,4,5,7,9,10,12])
