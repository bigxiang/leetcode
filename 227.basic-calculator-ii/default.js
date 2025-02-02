/*
 * @lc app=leetcode.cn id=227 lang=javascript
 * @lcpr version=30204
 *
 * [227] 基本计算器 II
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var calculate = function(s) {
  const stack = [];
  let num = 0;
  for (const c of s) {
    if (c === ' ') continue;
    if (isOperator(c)) {
      evaluate(stack, num, c);
      num = 0;
    } else {
      num = num * 10 + Number(c);
    }
  }

  return flush(stack, num);
};

var flush = function(stack, num) {
  if (stack.length === 0) return num;

  const lastOp = stack.pop();
  const lastNum = stack.pop();
  return flush(stack, calc(lastNum, lastOp, num));
}

var evaluate = function(stack, num, op) {
  if (stack.length === 0) {
    stack.push(num);
    stack.push(op);
    return;
  }

  if (op === '*' || op === '/') {
    const lastOp = stack[stack.length - 1];
    if (lastOp === '+' || lastOp === '-') {
      stack.push(num);
      stack.push(op);
      return;
    }

    stack.pop();
    const lastNum = stack.pop();
    stack.push(calc(lastNum, lastOp, num));
    stack.push(op);
  } else {
    const lastOp = stack.pop();
    const lastNum = stack.pop();
    evaluate(stack, calc(lastNum, lastOp, num), op);
  }
}

var isOperator = function(c) {
  return c === '+' || c === '-' || c === '*' || c === '/';
}

var calc = function(num1, op, num2) {
  switch (op) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      return num1 / num2 | 0;
  }
}
// @lc code=end



// @lcpr case=start
// "3+2*2"\n
// @lcpr case=end

// @lcpr case=start
// " 3/2 "\n
// @lcpr case=end

// @lcpr case=start
// " 3+5 / 2 "\n
// @lcpr case=end


// @lcpr case=start
// " 3+5 / 2 - 1 * 4 / 2 + 3-2+10/5"\n
// @lcpr case=end
