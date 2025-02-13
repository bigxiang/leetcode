/*
 * @lc app=leetcode.cn id=3019 lang=typescript
 * @lcpr version=30204
 *
 * [3019] 按键变更的次数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function countKeyChanges(s: string): number {
  if (s.length === 1) return 0;

  let count: number = 0;
  for (let i = 1; i < s.length; i++) {
    if (s[i].toLowerCase() != s[i - 1].toLowerCase()) count++;
  }

  return count;
};
// @lc code=end



// @lcpr case=start
// "aAbBcC"\n
// @lcpr case=end

// @lcpr case=start
// "AaAaAaaA"\n
// @lcpr case=end

// @lcpr case=start
// "A"\n
// @lcpr case=end

