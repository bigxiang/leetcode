#
# @lc app=leetcode.cn id=1401 lang=ruby
#
# [1401] 圆和矩形是否有重叠
#

# @lc code=start
# @param {Integer} radius
# @param {Integer} x_center
# @param {Integer} y_center
# @param {Integer} x1
# @param {Integer} y1
# @param {Integer} x2
# @param {Integer} y2
# @return {Boolean}
def check_overlap(radius, x_center, y_center, x1, y1, x2, y2)
  return true if x_center.between?(x1, x2) && (y_center + radius >= y1 && y_center - radius <= y2)
  return true if y_center.between?(y1, y2) && (x_center + radius >= x1 && x_center - radius <= x2)
  return true if x_center < x1 && y_center < y1 && (x1 - x_center) ** 2 + (y1 - y_center) ** 2 <= radius ** 2
  return true if x_center < x1 && y_center > y2 && (x1 - x_center) ** 2 + (y2 - y_center) ** 2 <= radius ** 2
  return true if x_center > x2 && y_center < y1 && (x2 - x_center) ** 2 + (y1 - y_center) ** 2 <= radius ** 2
  return true if x_center > x2 && y_center > y2 && (x2 - x_center) ** 2 + (y2 - y_center) ** 2 <= radius ** 2

  false
end
# @lc code=end

