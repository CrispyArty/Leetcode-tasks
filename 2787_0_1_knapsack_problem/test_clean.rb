# 2787 Ways_to_Express_an_Integer_as_Sum_of_Powers
# https://leetcode.com/problems/ways-to-express-an-integer-as-sum-of-powers/?envType=daily-question&envId=2025-08-13

# @param {Integer} n
# @param {Integer} x
# @return {Integer}
def number_of_ways(n, x)
  mod = (1e9 + 7).to_i

  dp = Array.new(n + 1, 0)

  k = (n ** (1/x.to_f)).ceil

  dp[0] = 1

  (1..k).each do |i|
    val = i ** x
    break if val > n

    n.downto(val) do |j|
      #   dp[j] += 1 if j == val
      #   dp[j] += dp[j - val] if (j - val).positive?

      dp[j] += dp[j - val] if j - val >= 0
    end
  end

  dp[n] % mod
end
