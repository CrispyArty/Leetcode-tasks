# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
  dp = Array.new(text1.length + 1) { Array.new(text2.length + 1, 0) }

  (text1.length - 1).downto(0).each do |i|
    (text2.length - 1).downto(0).each do |j|
      if text1[i] == text2[j]
        dp[i][j] += dp[i + 1][j + 1] + 1
      else
        dp[i][j] = [dp[i + 1][j], dp[i][j + 1]].max
      end
    end
  end

  dp[0][0]
end


text1 = "abcde"
text2 = "acge"
p longest_common_subsequence(text1, text2)


text1 = "gczz"
text2 = "cgch"
p longest_common_subsequence(text1, text2)
# hcbggcrc

