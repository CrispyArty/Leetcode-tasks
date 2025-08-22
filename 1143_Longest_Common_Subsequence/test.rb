# return subsequence string
def rec_dp(index1, index2, text1, text2, dp)
  return '' if index1 >= text1.length || index2 >= text2.length

  return dp[index1][index2] unless dp[index1][index2].nil?

  if text1[index1] == text2[index2]
    ans = text1[index1] + rec_dp(index1 + 1, index2 + 1, text1, text2, dp)
  else
    left = rec_dp(index1, index2 + 1, text1, text2, dp)
    bottom = rec_dp(index1 + 1, index2, text1, text2, dp)

    ans = left.length > bottom.length ? left : bottom
  end

  dp[index1][index2] = ans

  ans
end

# return subsequence length
def rec_dp1(index1, index2, text1, text2, dp)
  return 0 if index1 >= text1.length || index2 >= text2.length

  return dp[index1][index2] unless dp[index1][index2].nil?

  dp[index1][index2] = if text1[index1] == text2[index2]
                         rec_dp(index1 + 1, index2 + 1, text1, text2, dp) + 1
                       else
                         [
                           rec_dp(index1, index2 + 1, text1, text2, dp),
                           rec_dp(index1 + 1, index2, text1, text2, dp)
                         ].max
                       end
end

# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
  dp = Array.new(text1.length) { Array.new(text2.length, nil) }

  ans = rec_dp(0, 0, text1.chars, text2.chars, dp)

  p "-----dp:"
  dp.each do |d|
    p d
  end
  p '---------'
  ans
end

text1 = "abcde"
text2 = "acge"
p longest_common_subsequence(text1, text2)

text1 = "gczz"
text2 = "cgch"
p longest_common_subsequence(text1, text2)
# hcbggcrc

