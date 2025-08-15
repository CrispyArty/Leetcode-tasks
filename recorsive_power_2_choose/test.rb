def count_subsets(index, curr_or, max_or, nums, dp)
  if nums.length == index
    return curr_or == max_or ? 1 : 0
  end

  return dp[index][curr_or] unless dp[index][curr_or].nil?

  count1 = count_subsets(index + 1, curr_or, max_or, nums, dp) # excluded
  count2 = count_subsets(index + 1, curr_or | nums[index], max_or, nums, dp) # included
  count1 + count2
  dp[index][curr_or] = count1 + count2
  dp[index][curr_or]
end

# @param {Integer[]} nums
# @return {Integer}
def count_max_or_subsets(nums)
  max_or = nums.reduce(0) {|acc, curr| acc |= curr; acc}

  count_subsets(0, 0, max_or, nums, Array.new(nums.length) {[]})
end



nums = [3,2,1,5]
p count_max_or_subsets(nums)


nums = [2,2,2]
p count_max_or_subsets(nums)


# []
# [3]
# [3,2]
# [2]

# nums = [3,2,1,5]
# [1,2,3,5]
# [5,3,2,1]
# 5 | 3 -> plus the rest of array = + 2^2 = (1 << 2) = 4
# 5 | 2 -> plus the rest of array = + 2^(2 - 1) = (1 << (2 - 1)) = 2 - minus count already found


# 5 7
# [3,2,1,5,4]
# [5,4,3,2,1]
# 7 -> = + 2^4 = 16
# 5 | 3 -> +2^2 = 3






# 5 7
# [3,2,1,4,5,7]
# [7,5,4,3,2,1]
# 7 -> = + 2^4 = 16
# 5 | 3 -> +2^2 = 3


#

# [3,2,1,5,5,5]
# 18


# - [3,5]
# - [3,1,5]
# - [3,2,5]
# - [3,2,1,5]
# - [2,5]
# - [2,1,5]


# k * z + k * z
#
# 6 * 2 + 6

# 2^x = 15

# log

# (1 << z) - 1

# 2^3 +
# 2^3 - 1 + 2^2 - 1 = 8 - 1 + 4 - 1