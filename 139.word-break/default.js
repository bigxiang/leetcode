/*
 * @lc app=leetcode.cn id=139 lang=javascript
 * @lcpr version=30204
 *
 * [139] 单词拆分
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @param {string[]} wordDict
 * @return {boolean}
 */
var wordBreak = function(s, wordDict) {
  const trie = new Trie();
  let maxLen = 0;
  for (const word of wordDict) {
    maxLen = Math.max(maxLen, word.length);
    trie.add(word);
  }

  const dp = new Array(s.length).fill(false);
  for (let i = 0; i < s.length; i++) {
    for (let j = Math.max(0, i - maxLen + 1); j <= i; j++) {
      if ((j == 0 || dp[j - 1]) && trie.search(s, j, i)) {
        dp[i] = true;
        break;
      }
    }
  }
  return dp[s.length - 1];
};

class TrieNode {
  constructor(char) {
    this.char = char;
    this.children = new Map();
    this.isWord = false;
  }
}

class Trie {
  constructor() {
    this.data = new TrieNode();
  }

  add(word) {
    let node = this.data;
    for (let char of word) {
      if (!node.children.has(char)) {
        node.children.set(char, new TrieNode(char));
      }
      node = node.children.get(char);
    }
    node.isWord = true;
  }

  search(word, start, end) {
    let node = this.data;
    for (let i = start; i <= end; i++) {
      const char = word[i];
      if (!node.children.has(char)) return false;

      node = node.children.get(char);
    }
    return node.isWord;
  }
}
// @lc code=end



// @lcpr case=start
// "leetcode"\n["leet", "code"]\n
// @lcpr case=end

// @lcpr case=start
// "applepenapple"\n["apple", "pen"]\n
// @lcpr case=end

// @lcpr case=start
// "catsandog"\n["cats", "dog", "sand", "and", "cat"]\n
// @lcpr case=end

// @lcpr case=start
// "catanddog"\n["catanddog"]\n
// @lcpr case=end

// @lcpr case=start
// "catanddognocatnodog"\n["catanddog", "no", "cat", "dog"]\n
// @lcpr case=end
