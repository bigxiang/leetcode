/*
 * @lc app=leetcode.cn id=3175 lang=javascript
 * @lcpr version=30204
 *
 * [3175] 找到连续赢 K 场比赛的第一位玩家
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} skills
 * @param {number} k
 * @return {number}
 */
var findWinningPlayer = function(skills, k) {
  const n = skills.length;
  if (k >= n - 1) {
    let maxIndex = 0;
    let max = 0;
    for (let i = 0; i < n; i++) {
      if (skills[i] > max) {
        maxIndex = i;
        max = skills[i];
      }
    }
    return maxIndex;
  }

  let i = 0;
  let matchCount;
  let found = true;
  while (i < n) {
    matchCount = i === 0 ? k : k - 1;
    found = true;
    for (let j = i + 1; j <= i + matchCount; j++) {
      if (j > n - 1) return i;
      if (skills[i] > skills[j]) continue;

      i = j;
      found = false;
      break;
    }

    if (found) return i;
  }
};
// @lc code=end



// @lcpr case=start
// [4,2,6,3,9]\n2\n
// @lcpr case=end

// @lcpr case=start
// [2,5,4]\n3\n
// @lcpr case=end

// @lcpr case=start
// [4,2,6,3,9]\n4\n
// @lcpr case=end

// @lcpr case=start
// [4,2,6,3,9,1,7,5,8,10]\n6\n
// @lcpr case=end
