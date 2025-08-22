# 1092. Shortest Common Supersequence
# https://leetcode.com/problems/shortest-common-supersequence/description/?envType=problem-list-v2&envId=dynamic-programming

def find_lcs(index1, index2, str1, str2, dp)
  return '' if index1 >= str1.length || index2 >= str2.length

  return dp[index1][index2] unless dp[index1][index2].nil?

  if str1[index1] == str2[index2]
    ans = str1[index1] + find_lcs(index1 + 1, index2 + 1, str1, str2, dp)
  else
    first = find_lcs(index1, index2 + 1, str1, str2, dp)
    second = find_lcs(index1 + 1, index2, str1, str2, dp)

    ans = first.length > second.length ? first : second
  end

  dp[index1][index2] = ans

  ans
end

def shortest_common_supersequence(str1, str2)
  dp = Array.new(str1.length) { Array.new(str2.length, nil) }

  longest_common = find_lcs(0, 0, str1, str2, dp)

  i = j = 0

  super_sequence = ''


  # fill longest common sequence with missing chars from both strings
  longest_common.chars.each do |char|
    while str1[i] != char && i < str1.length
      super_sequence += str1[i]
      i += 1
    end

    while str2[j] != char && j < str2.length
      super_sequence += str2[j]
      j += 1
    end

    super_sequence += char
    i += 1
    j += 1
  end

  # fill trail end of strings
  super_sequence + (str1[i..] || '') + (str2[j..] || '')
end

# str1 = "abac"
# str2 = "cab"
# p shortest_common_supersequence(str1, str2)
# cabac
#
#
# str1 = "bbbaaaba"
# str2 = "bbababbb"
# p shortest_common_supersequence(str1, str2)
#
#
str1 = "bbbaaaba"
str2 = "bbababbb"
p shortest_common_supersequence(str1, str2)
# bbbaaababbb

# bbbab
# bbababbb
# bbbaaaba

# "bbbaaaba" - bbbab = aaa
# "bbababbb" - bbbab = abb
