/*
 * @lc app=leetcode.cn id=3138 lang=javascript
 * @lcpr version=30204
 *
 * [3138] 同位字符串连接的最小长度
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var minAnagramLength = function(s) {
  const charCount = new Array(26).fill(0);

  for (let i = 0; i < s.length; i++) {
    charCount[s.charCodeAt(i) - 'a'.charCodeAt(0)]++;
  }

  let maxChunks = s.length;
  for (let i = 0; i < 26; i++) {
    if (charCount[i] === 0) continue;

    maxChunks = gcd(maxChunks, charCount[i]);
  }

  for (let i = maxChunks; i >= 1; i--) {
    if (allAnagram(s, i)) return s.length / i;
  }
};

var allAnagram = function(s, chunks) {
  const sLength = s.length;
  const substrLength = sLength / chunks;
  if (substrLength !== Math.floor(substrLength)) return false;

  const charCount = new Array(26).fill(0);
  for (let i = 0; i < substrLength; i++) {
    charCount[s.charCodeAt(i) - 'a'.charCodeAt(0)]++;
  }

  for (let c = 2; c <= chunks; c++) {
    if (!anagram([...charCount], s, (c - 1) * substrLength, substrLength)) {
      return false;
    }
  }

  return true;
}

var anagram = function(charCount, s, start, length) {
  for (let i = start; i < start + length; i++) {
    charCount[s.charCodeAt(i) - 'a'.charCodeAt(0)]--;
  }

  return charCount.every(count => count === 0);
}

var gcd = function(a, b) {
  return b === 0 ? a : gcd(b, a % b);
}
// @lc code=end



// @lcpr case=start
// "abba"\n
// @lcpr case=end

// @lcpr case=start
// "aabb"\n
// @lcpr case=end



// @lcpr case=start
// "cdef"\n
// @lcpr case=end

// @lcpr case=start
// "aabbabab"\n
// @lcpr case=end

// @lcpr case=start
// "aaaaaaaabbaaaaaaaaabaaaaaaa"\n
// @lcpr case=end
