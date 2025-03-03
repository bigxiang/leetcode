#
# @lc app=leetcode.cn id=1278 lang=ruby
# @lcpr version=30204
#
# [1278] 分割回文串 III
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @param {Integer} k
# @return {Integer}
def palindrome_partition(s, k)
  min_update = calculate_min_update(s)
  dp = Array.new(s.length) { Array.new(k + 1, nil) }

  partition_dfs(s, k, 0, dp, min_update)
end

def partition_dfs(s, k, i, dp, min_update)
  return min_update[i][s.length - 1] if k == 1
  return dp[i][k] if dp[i][k]

  max_len = s.length - k - i + 1
  dp[i][k] =
    (1..max_len)
      .map { |len|
        j = i + len - 1
        min_update[i][j] + partition_dfs(s, k - 1, j + 1, dp, min_update)
      }
      .min
end

def calculate_min_update(s)
  len = s.length
  dp = Array.new(len) { Array.new(len, 0) }
  (1..len).each do |l|
    (0..len - l).each do |i|
      j = i + l - 1
      if i == j
        dp[i][j] = 0
      elsif i + 1 == j
        dp[i][j] = s[i] == s[j] ? 0 : 1
      else
        dp[i][j] = s[i] == s[j] ? dp[i + 1][j - 1] : dp[i + 1][j - 1] + 1
      end
    end
  end

  dp
end
# @lc code=end



#
# @lcpr case=start
# "abc"\n2\n
# @lcpr case=end

# @lcpr case=start
# "aabbc"\n3\n
# @lcpr case=end

# @lcpr case=start
# "leetcode"\n8\n
# @lcpr case=end

# @lcpr case=start
# "leetcode"\n1\n
# @lcpr case=end

# @lcpr case=start
# "abcdefghijkabcdefsfdlfjadlsfldsfjdlljlkklji"\n7\n
# @lcpr case=end

# @lcpr case=start
# "abcdefghijkabcdefsfdlfjadlsfldsfjdlljlkklji"\n4\n
# @lcpr case=end

#

