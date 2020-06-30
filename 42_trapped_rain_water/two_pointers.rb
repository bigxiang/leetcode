# @param {Integer[]} height
# @return {Integer}
def trap(height)
  left_index = 0
  right_index = height.size - 1
  water_trapped = 0
  left_max = 0
  right_max = 0

  while left_index < right_index
    if height[left_index] < height[right_index]
      if height[left_index] > left_max
        left_max = height[left_index]
      else
        water_trapped += left_max - height[left_index]
      end

      left_index += 1
    else
      if height[right_index] > right_max
        right_max = height[right_index]
      else
        water_trapped += right_max - height[right_index]
      end

      right_index -= 1
    end
  end

  water_trapped
end
