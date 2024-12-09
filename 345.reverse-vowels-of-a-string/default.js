/*
 * @lc app=leetcode.cn id=345 lang=javascript
 * @lcpr version=30204
 *
 * [345] 反转字符串中的元音字母
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {string}
 */
var reverseVowels = function(s) {
  const arr = s.split('');
  let left = 0;
  let right = arr.length - 1;
  const vowels = new Set(['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']);

  while (left < right) {
    if (vowels.has(arr[left]) && vowels.has(arr[right])) {
      [arr[left], arr[right]] = [arr[right], arr[left]];
      left++;
      right--;
    }
    else if (vowels.has(arr[left])) {
      right--;
    }
    else {
      left++;
    }
  }
  return arr.join('');
};
// @lc code=end



// @lcpr case=start
// "IceCreAm"\n
// @lcpr case=end

// @lcpr case=start
// "leetcode"\n
// @lcpr case=end
