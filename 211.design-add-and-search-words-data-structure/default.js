/*
 * @lc app=leetcode.cn id=211 lang=javascript
 * @lcpr version=30204
 *
 * [211] 添加与搜索单词 - 数据结构设计
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
var WordNode = function(char) {
  this.char = char;
  this.children = new Map();
  this.isWord = false;
}

var WordDictionary = function() {
  this.data = new WordNode();
};

/**
 * @param {string} word
 * @return {void}
 */
WordDictionary.prototype.addWord = function(word) {
  let node = this.data;
  for (const char of word) {
    if (!node.children.has(char)) {
      node.children.set(char, new WordNode(char));
    }
    node = node.children.get(char);
  }
  node.isWord = true;
};

/**
 * @param {string} word
 * @return {boolean}
 */
WordDictionary.prototype.search = function(word) {
  let nodes = [this.data];
  for (const char of word) {
    const newNodes = [];

    if (char === '.') {
      nodes.forEach((node) => {
        node.children.forEach((value, _key) => newNodes.push(value))
      })
    } else {
      nodes.forEach((node) => {
        if (node.children.has(char)) {
          newNodes.push(node.children.get(char));
        }
      })
    }

    nodes = newNodes;
  }

  return nodes.some((node) => node.isWord);
};

/**
 * Your WordDictionary object will be instantiated and called as such:
 * var obj = new WordDictionary()
 * obj.addWord(word)
 * var param_2 = obj.search(word)
 */
// @lc code=end

// @lcpr case=start
// ["WordDictionary","addWord","addWord","addWord","search","search","search"]\n[[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"]]\n
// @lcpr case=end


// @lcpr case=start
// ["WordDictionary","addWord","addWord","addWord","search","search","search","search"]\n[[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]\n
// @lcpr case=end

// @lcpr case=start
// ["WordDictionary","addWord","addWord","addWord","search","search","search","search"]\n[[],["bad"],["dad"],["mad"],["pad"],["bad"],["..c"],["b.."]]\n
// @lcpr case=end
