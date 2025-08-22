def rec_dp(index1, index2, text1, text2, dp)
  return [0, []] if index1 >= text1.length || index2 >= text2.length

  return dp[index1][index2] unless dp[index1][index2].nil?

  # p "stext1: #{text1[index1..]}, text2: #{text2[index2..]}"

  # p "text1[index1]: #{index1}/#{text1[index1]} | text2[index2]: #{index2}/#{text2[index2]}"
  if text1[index1] == text2[index2]
    ans = rec_dp(index1 + 1, index2 + 1, text1, text2, dp)

    # p "text1[index1]: #{index1}/#{text1[index1]} | text2[index2]: #{index2}/#{text2[index2]} | ans: #{ans}"

    ans[0] += 1
    ans[1].unshift text1[index1]
  else
    m = [
      rec_dp(index1, index2 + 1, text1, text2, dp),
      rec_dp(index1 + 1, index2, text1, text2, dp)
    ]

    # p "max: #{m}"
    ans = m.max
  end

  dp[index1][index2] = ans.dup

  ans
end

def rec_dp1(index1, index2, text1, text2, dp)
  return 0 if index1 >= text1.length || index2 >= text2.length

  return dp[index1][index2] unless dp[index1][index2].nil?

  # p "stext1: #{text1[index1..]}, text2: #{text2[index2..]}"

  # p "text1[index1]: #{index1}/#{text1[index1]} | text2[index2]: #{index2}/#{text2[index2]}"
  if text1[index1] == text2[index2]
    ans = rec_dp(index1 + 1, index2 + 1, text1, text2, dp) + 1
  else
    m = [
      rec_dp(index1, index2 + 1, text1, text2, dp),
      rec_dp(index1 + 1, index2, text1, text2, dp)
    ]

    # p "max: #{m}"
    ans = m.max
  end

  dp[index1][index2] = ans

  ans
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


# text1 = "abcde"
# text2 = "acge"
# p longest_common_subsequence(text1, text2)


text1 = "gczz"
text2 = "cgch"
p longest_common_subsequence(text1, text2)
# hcbggcrc

