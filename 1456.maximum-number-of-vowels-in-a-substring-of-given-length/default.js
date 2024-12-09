/*
 * @lc app=leetcode.cn id=1456 lang=javascript
 * @lcpr version=30204
 *
 * [1456] 定长子串中元音的最大数目
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @param {number} k
 * @return {number}
 */
var maxVowels = function(s, k) {
  const vowels = new Set(['a', 'e', 'i', 'o', 'u']);
  let left = 0, right = k - 1;
  let vowelsCount = s.slice(left, right + 1).split('').filter(c => vowels.has(c)).length;
  let maxVowels = vowelsCount;
  for (let right = k; right < s.length; right++) {
    if (vowels.has(s[right])) vowelsCount++;
    if (vowels.has(s[left])) vowelsCount--;
    left++;
    maxVowels = Math.max(maxVowels, vowelsCount);
  }
  return maxVowels;
};
// @lc code=end



// @lcpr case=start
// "abciiidef"\n3\n
// @lcpr case=end

// @lcpr case=start
// "aeiou"\n2\n
// @lcpr case=end

// @lcpr case=start
// "leetcode"\n3\n
// @lcpr case=end

// @lcpr case=start
// "rhythms"\n4\n
// @lcpr case=end

// @lcpr case=start
// "tryhard"\n4\n
// @lcpr case=end


