dp = {}

# dp[2][3] = true
multi = Array.new(2) { Array.new(3) {false} }
multi[1][2] = true
p multi
# p dp~