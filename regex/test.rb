# @param {String} s
# @param {String} p
# @return {Boolean}

def char_match?(char, pattern_char)
  pattern_char == '.' || char == pattern_char
end

# s = "essss"
# p = "s*s*s*s*s*s*e"



@i = 0
def is_match1(s, p)
  return s.nil? if p.nil?

  @i += 1
  p @i
  match = !s.nil? && char_match?(s[0], p[0])

  if p[1] == "*"
    is_match(s, p[2..-1]) || match && is_match(s[1..-1], p)
  else
    match && is_match(s[1..-1], p[1..-1])
  end
end

# s = "esssse"
# p = "es*e"
# s = "aabcbcbcaccbcaabc"
# p = ".*a*aa*.*b*.c*.*a*"
# s = "mississippi"
# p = "mis*is*ip*."
# s = "sssssssssa"
# p = "s*s*s*s*s*s*s*s*a"
# s = "asdasd"
# p = "asdasd"
def is_match(s, p)
  dp = Array.new(s.length + 1) { Array.new(p.length + 1) {false} }
  dp[s.length][p.length] = true

  i = s.length

  while i >=0
    j = p.length - 1
    while j >=0
      first_match = i < s.length && char_match?(s[i], p[j])

      if p[j + 1] == '*'
        dp[i][j] = dp[i][j + 2] || (first_match && dp[i + 1][j])
      else
        dp[i][j] = first_match && dp[i + 1][j + 1]
      end

      p "#{i}, #{j}", dp[i][j]

      j -= 1
    end

    i -= 1
  end

  dp[0][0]
end

# s = "sssssssssa"
# p = "s*s*s*s*s*s*s*s*a"
# p is_match(s, p)

s = "asdasd"
p = "asdasd"
p is_match(s, p)

# s = "aaaaaaaaaaaaaaaaaaab"
# p = "a*a*a*a*a*"
# p is_match(s, p)
