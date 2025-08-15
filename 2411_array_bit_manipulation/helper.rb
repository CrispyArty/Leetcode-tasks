s = 0

start = Time.now
s += Time.now - start
p s

# [1,0,2,1,3,2]
# [2,3,1,2,0,1]

# 010 = 2
# [-1, 5, -1,...
# 011
#


# 001
#

# 1: 001
# 2: 010
# 3: 011




# p "max_or: #{max_or}"
# #  [1,0,2,1,3]
# ans = []
# right = curr = 0
# (0...nums.length).each do |left|
#   p '---------------'
#   # curr ^= nums[left]
#
#   # p "nums[left]: #{nums[left]}"
#   # p "curr_before: #{curr}"
#   curr = 0
#   max_index = right = left
#
#   while curr != max_or && right < nums.length
#     prev = curr
#     curr |= nums[right]
#     max_index = right if curr > prev
#
#     p "curr~~: #{curr}"
#     right += 1
#   end
#
#   p "curr_after: #{curr}"
#   p "left: #{left} right: #{right}"
#
#   ans[left] = max_index - left + 1
#
#   # curr ^= nums[left]
#
#   p ans
# end

# p left
#def smallest_subarrays(nums)
#   max_or = nums.reduce(0) {|acc, n| acc |= n; acc }
#
#   p "max_or: #{max_or}"
#   # [1,0,2,1,3]
#   ans = []
#   right = curr = 0
#   (0...nums.length).each do |left|
#     p '---------------'
#
#     while curr != max_or
#       curr |= nums[right]
#       p "curr~~: #{curr}"
#       right += 1
#     end
#
#     p "curr: #{curr}"
#     p "left: #{left} right: #{right}"
#
#     ans[left] = right - left if curr == max_or
#
#     p ans
#   end
#
#
#   ans
# end

#left = curr = 0
#   (0...nums.length).each do |right|
#     curr |= nums[right]
#
#     p '---------------'
#     p "curr: #{curr}"
#     p "left: #{left} right: #{right}"
#
#     ans[right] = right - left + 1 if curr == max_or
#
#     while curr == max_or
#       curr ^= nums[left]
#       left += 1
#     end
#   end