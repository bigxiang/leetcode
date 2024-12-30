/*
 * @lc app=leetcode.cn id=1366 lang=javascript
 * @lcpr version=30204
 *
 * [1366] 通过投票对团队排名
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string[]} votes
 * @return {string}
 */
var rankTeams = function(votes) {
  if (votes.length === 1) return votes[0];

  const voteMap = new Map();
  const teamCount = votes[0].length;
  for (let i = 0; i < votes.length; i++) {
    for (let j = 0; j < teamCount; j++) {
      const score = 27**(teamCount-j-1);
      voteMap.set(votes[i][j], (voteMap.get(votes[i][j]) || 0) + score);
    }
  }

  return [...voteMap].sort((a, b) => {
    if (a[1] === b[1]) return a[0] < b[0] ? -1 : 1;
    return b[1] - a[1];
  }).map(([team, _score]) => team).join('');
};
// @lc code=end



// @lcpr case=start
// ["ABC","ACB","ABC","ACB","ACB"]\n
// @lcpr case=end

// @lcpr case=start
// ["WXYZ","XYZW"]\n
// @lcpr case=end

// @lcpr case=start
// ["ZMNAGUEDSJYLBOPHRQICWFXTVK"]\n
// @lcpr case=end

// @lcpr case=start
// ["AB","BA"]\n
// @lcpr case=end

// @lcpr case=start
// ["ABCDEFGHIJKLMNOPQRSTUVWXYZ","ZYXWVUTSRQPONMLKJIHGFEDCBA"]\n
// @lcpr case=end
