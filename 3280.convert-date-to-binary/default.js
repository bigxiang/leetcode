/*
 * @lc app=leetcode.cn id=3280 lang=javascript
 * @lcpr version=30204
 *
 * [3280] 将日期转换为二进制表示
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} date
 * @return {string}
 */
var convertDateToBinary = function(date) {
  return `${Number(date.slice(0,4)).toString(2)}-${Number(date.slice(5,7)).toString(2)}-${Number(date.slice(8,10)).toString(2)}`;
};
// @lc code=end



// @lcpr case=start
// "2080-02-29"\n
// @lcpr case=end

// @lcpr case=start
// "1900-01-01"\n
// @lcpr case=end


