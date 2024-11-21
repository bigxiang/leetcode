#
# @lc app=leetcode.cn id=733 lang=ruby
# @lcpr version=30204
#
# [733] 图像渲染
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} color
# @return {Integer[][]}
def flood_fill(image, sr, sc, color)
  image if image[sr][sc] == color

  fill(image, sr, sc, image[sr][sc], color)
  image
end

def fill(image, i, j, same_as, target)
  return if i < 0 || i >= image.size || j < 0 || j >= image[0].size || image[i][j] == target || image[i][j] != same_as

  image[i][j] = target
  fill(image, i - 1, j, same_as, target)
  fill(image, i, j - 1, same_as, target)
  fill(image, i + 1, j, same_as, target)
  fill(image, i, j + 1, same_as, target)
end
# @lc code=end

#
# @lcpr case=start
# [[1,1,1],[1,1,0],[1,0,1]]\n1\n1\n2\n
# @lcpr case=end

# @lcpr case=start
# [[0,0,0],[0,0,0]]\n0\n0\n0\n
# @lcpr case=end

#
