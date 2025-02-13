/*
 * @lc app=leetcode.cn id=2264 lang=typescript
 * @lcpr version=30204
 *
 * [2264] 字符串中最大的 3 位相同数字
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function largestGoodInteger(num: string): string {
  let max:string = '';
  for (let i:number  = 0; i <= num.length - 3; i++) {
    let str:string = num.slice(i, i+3);
    if (Number(str) % 111 === 0 && str > max) {
      max = str;
    }
  }

  return max;
};
// @lc code=end



// @lcpr case=start
// "6777133339"\n
// @lcpr case=end

// @lcpr case=start
// "2300019"\n
// @lcpr case=end

// @lcpr case=start
// "42352338"\n
// @lcpr case=end

// @lcpr case=start
// "222"\n
// @lcpr case=end

// @lcpr case=start
// "2221"\n
// @lcpr case=end
