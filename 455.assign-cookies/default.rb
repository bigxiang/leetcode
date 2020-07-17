#
# @lc app=leetcode id=455 lang=ruby
#
# [455] Assign Cookies
#

# @lc code=start
# @param {Integer[]} g
# @param {Integer[]} s
# @return {Integer}
def find_content_children(g, s)
  g = g.sort
  s = s.sort

  gi = 0
  si = 0

  while gi <= g.size - 1 && si <= s.size - 1
    if s[si] >= g[gi]
      gi += 1
      si += 1
    else
      si += 1
    end
  end

  gi
end
# @lc code=end

