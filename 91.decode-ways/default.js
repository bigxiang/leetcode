/*
 * @lc app=leetcode.cn id=91 lang=javascript
 * @lcpr version=30204
 *
 * [91] 解码方法
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var numDecodings = function(s) {
  let groupable = 0, all = 0;
  for (let i = 0; i < s.length; i++) {
    if ((i === 0 || s[i-1] > '2' || s[i-1] === '0') && s[i] === '0') return 0;

    if (i === 0) {
      all = 1;
      groupable = s[i] === '1' || s[i] === '2' ? 1 : 0;
    } else {
      if (s[i] === '1' || s[i] === '2') {
        [groupable, all] = [all, all + groupable];
      }
      else if (s[i] === '0') {
        [groupable, all] = [0, groupable];
      }
      else if (s[i-1] === '1' || s[i-1] === '2' && s[i] <= '6') {
        [groupable, all] = [0, all + groupable];
      }
      else {
        groupable = 0;
      }
    }
  }

  return all;
};
// @lc code=end

// @lcpr case=start
// "1"\n
// @lcpr case=end

// @lcpr case=start
// "0"\n
// @lcpr case=end

// @lcpr case=start
// "10"\n
// @lcpr case=end

// @lcpr case=start
// "12"\n
// @lcpr case=end

// @lcpr case=start
// "226"\n
// @lcpr case=end

// @lcpr case=start
// "227"\n
// @lcpr case=end

// @lcpr case=start
// "2260"\n
// @lcpr case=end

// @lcpr case=start
// "06"\n
// @lcpr case=end

// @lcpr case=start
// "2613574820121055"\n
// @lcpr case=end

