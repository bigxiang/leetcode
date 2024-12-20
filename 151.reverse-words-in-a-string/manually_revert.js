/*
 * @lc app=leetcode.cn id=151 lang=javascript
 * @lcpr version=30204
 *
 * [151] 反转字符串中的单词
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {string}
 */
var reverseWords = function(s) {
  let arr = [];
  for (let i = 0; i < s.length; i++) {
    arr.push(s[i]);
  }

  arr = strip(trim(arr));
  reverse(arr, 0, arr.length - 1);
  let start = 0;
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === ' ' || i === arr.length - 1) {
      reverse(arr, start, i === arr.length - 1 ? i : i - 1);
      start = i + 1;
    }
  }
  return arr.join('');
};

var reverse = function(arr, start, end) {
  while (start < end) {
    [arr[start], arr[end]] = [arr[end], arr[start]];
    start++;
    end--;
  }
}

var strip = function(arr) {
  const result = [];
  for (let i = 0; i < arr.length; i++) {
    if (i > 0 && arr[i] === ' ' && arr[i - 1] === ' ') continue;
    result.push(arr[i]);
  }
  return result;
}

var trim = function(arr) {
  let start = 0, end = arr.length - 1;
  while (start <= end) {
    if (arr[start] !== ' ' && arr[end] !== ' ') break;
    if (arr[start] === ' ') start++;
    if (arr[end] === ' ') end--;
  }

  return arr.slice(start, end + 1);
}
// @lc code=end



// @lcpr case=start
// "the sky is blue"\n
// @lcpr case=end

// @lcpr case=start
// "   hello world  "\n
// @lcpr case=end

// @lcpr case=start
// "a good    example"\n
// @lcpr case=end


