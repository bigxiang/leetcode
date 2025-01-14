#
# @lc app=leetcode.cn id=383 lang=ruby
# @lcpr version=30204
#
# [383] 赎金信
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  r_chars = Array.new(26, 0)
  ransom_note.each_char do |c|
    r_chars[c.ord - 'a'.ord] += 1
  end
  m_chars = Array.new(26, 0)
  magazine.each_char do |c|
    m_chars[c.ord - 'a'.ord] += 1
  end

  (0...26).each do |i|
    return false if r_chars[i] > m_chars[i]
  end
  true
end
# @lc code=end

#
# @lcpr case=start
# "a"\n"b"\n
# @lcpr case=end

# @lcpr case=start
# "aa"\n"ab"\n
# @lcpr case=end

# @lcpr case=start
# "aa"\n"aab"\n
# @lcpr case=end

# @lcpr case=start
# "a"\n"b"\n
# @lcpr case=end

#
