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

  let maxChunks;
  for (let i = 0; i < 26; i++) {
    if (charCount[i] === 0) {
      continue;
    }

    maxChunks = maxChunks ? gcd(maxChunks, charCount[i]) : charCount[i];
  }

  if (maxChunks === 1) return s.length;

  for (let chunks = maxChunks; chunks >= 2; chunks--) {
    if (Math.floor(s.length / chunks) * chunks !== s.length) continue;

    if (anagram(s, chunks)) {
      return s.length / chunks;
    }
  }

  return s.length;
};

var anagram = function(s, chunks) {
  const charCount = new Array(26).fill(0);
  for (let i = 0; i < s.length / chunks; i++) {
    charCount[s.charCodeAt(i) - 'a'.charCodeAt(0)]++;
  }

  for (let c = 1; c < chunks; c++) {
    const tCharCount = new Array(26).fill(0);
    for (let i = s.length / chunks * c; i < s.length / chunks * (c + 1); i++) {
      tCharCount[s.charCodeAt(i) - 'a'.charCodeAt(0)]++;
    }

    for (let i = 0; i < 26; i++) {
      if (charCount[i] !== tCharCount[i]) {
        return false;
      }
    }
  }

  return true;
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
