# @param {Integer} n
# @param {Integer} x
# @return {Integer}
def number_of_ways(n, x)
  mod = (1e9 + 7).to_i

  dp = Array.new(n + 1, 0)


  # k = n ** (1/x)
  k = (n ** (1/x.to_f)).ceil

  dp[0] = 1
  p "k: #{k}"
  (1..k).each do |i|
    p '-----------------'
    p "dp_before: #{dp}"

    val = i ** x

    break if val > n

    n.downto(val) do |j|
      # dp[j] += 1 if j == val
      dp[j] += dp[j - val] if j - val >= 0
    end
    # (1..n).each do |j|
    #
    #   dp[j] += 1 if j == val
    #   dp[j] += dp[j - val] if (j - val).positive?
    # end
    p "dp_after: #{dp}"

  end

  p dp

  dp[n] % mod

  # dp[0][0] = 1
  # p dp
  #
  # (1..n).each do |i|
  #   val = i**x
  #
  #   (0..n).each do |j|
  #     dp[i][j] = dp[i - 1][j]
  #     if j >= val
  #       dp[i][j] = (dp[i][j] + dp[i - 1][j - val]) % mod
  #     end
  #   end
  # end

  # p '['
  # dp.each { |d| p d }
  # p ']'
  # dp[n][n]
end

# n = 64
# x = 3
# p number_of_ways(n, x)

# n = 10
# x = 2
# p number_of_ways(n, x)
# # 1
#
#
# n = 120
# x = 2
# p number_of_ways(n, x)
# # 4
#
n = 45
x = 1
p number_of_ways(n, x)
# # 2048
#
#
# n = 10
# x = 1
# p number_of_ways(n, x)
# # 10

# 1 + 2 + 3 + 4
# 1 + 9
# 2 + 8
# 3 + 7
# 4 + 6
# 1 + 2 + 7 = 10
# 1 + 3 + 6 = 10
# 1 + 4 + 5 = 10
# 2 + 3 + 5 = 10
# 10 = 10

# n = 5
# x = 2
# p number_of_ways(n, x)
# 1

# n = 6
# x = 1
# p number_of_ways(n, x)
# 4