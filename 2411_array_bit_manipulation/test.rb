# @param {Integer[]} arr
# @return {Integer}
# @param {Integer[]} nums
# @return {Integer[]}
def smallest_subarrays(nums)
  pos = [-1] * 31
  ans = [0] * nums.length
  # Given an integer array arr, return the number of distinct bitwise ORs of all the non-empty subarrays of arr.
  # The bitwise OR of a subarray is the bitwise OR of each integer in the subarray. The bitwise OR of a subarray of one integer is that integer.
  # A subarray is a contiguous non-empty sequence of elements within an array.

  (0...nums.length).reverse_each do |i|
    j = i
    p '-----------------------------------------------------------'
    p "pos_before: #{pos}"
    (0...pos.length).each do |bit|
      if (nums[i] & (1 << bit)) == 0
        if pos[bit] != -1
          j = [j, pos[bit]].max
        end
      else
        pos[bit] = i
      end
    end
    p "pos_after: #{pos}"
    p "i: #{i} j: #{j}"

    ans[i] = j - i + 1
  end

  ans
end

# @param {Integer[]} nums
# @return {Integer}
def longest_subarray(nums)
  max = sub_length = ans = 0
  (0...nums.length).each do |index|
    if max < nums[index]
      max = nums[index]
      ans = sub_length = 0
    end

    sub_length = nums[index] == max ? sub_length + 1 : 0
    ans = [ans, sub_length].max
  end

  ans
end


# @param {Integer[]} arr
# @return {Integer}
def subarray_bitwise_o_rs(arr)
  pos = [-1] * 31
  map = {}
  prev = {}
  ans = new_b = 0

  arr.each do |num|
    curr = {num => true}
    prev.each do |prev_num|
      curr[num | prev_num[0]] = true
    end

    map.merge!(curr)
    prev = curr
  end

  map.keys.length
end


# 4, 2, 1
arr = [4,2,1,5]
p subarray_bitwise_o_rs(arr)


# arr = [1,2,4]
# p subarray_bitwise_o_rs(arr)

#############################################

# nums = [1,2,3,3,2,2]
# p longest_subarray(nums)
#
#
# nums = [96317,96317,96317,96317,96317,96317,96317,96317,96317,279979]
# p longest_subarray(nums)
#
#
# nums = [311155,311155,311155,311155,311155,311155,311155,311155,201191,311155]
# p longest_subarray(nums)

#############################################

# nums = [1,0,2,1,3,2]
# p smallest_subarrays(nums)

# nums = [2, 3, 1, 2, 0, 1]
# p smallest_subarrays(nums)

# nums = [1,2]
# p smallest_subarrays(nums)


