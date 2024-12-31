/*
 * @lc app=leetcode.cn id=649 lang=javascript
 * @lcpr version=30204
 *
 * [649] Dota2 参议院
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} senate
 * @return {string}
 */
var predictPartyVictory = function(senate) {
  const n = senate.length;

  const rQueue = [], dQueue = [];
  for (let i = 0; i < n; i++) {
    if (senate[i] === 'R') rQueue.push(i);
    else dQueue.push(i);
  }

  while (rQueue.length > 0 && dQueue.length > 0) {
    if (rQueue[0] < dQueue[0]) {
      rQueue.push(rQueue.shift() + n);
      dQueue.shift();
    }
    else {
      dQueue.push(dQueue.shift() + n);
      rQueue.shift();
    }
  }

  return rQueue.length > 0 ? 'Radiant' : 'Dire';
};
// @lc code=end



// @lcpr case=start
// "RD"\n
// @lcpr case=end

// @lcpr case=start
// "RDD"\n
// @lcpr case=end


