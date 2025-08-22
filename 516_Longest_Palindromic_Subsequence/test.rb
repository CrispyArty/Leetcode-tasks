def rec_pali1(left, right, str)
  return str[left] if left == right
  return '' if left > right

  return @dp[left][right] unless @dp[left][right].nil?

  if str[left] == str[right]
    ans = str[left] + rec_pali(left + 1, right - 1, str) + str[right]
  else
    first = rec_pali(left, right - 1, str)
    second = rec_pali(left + 1, right, str)

    ans = first.length > second.length ? first : second
  end

  @dp[left][right] = ans

  ans
end

# @param {String} s
# @return {String} full palindrome string
def rec_pali(left, right, str)
  return 1 if left == right
  return 0 if left > right

  return @dp[left][right] unless @dp[left][right].nil?

  ans = if str[left] == str[right]
          2 + rec_pali(left + 1, right - 1, str)
        else
          [
            rec_pali(left, right - 1, str),
            rec_pali(left + 1, right, str)
          ].max
        end

  @dp[left][right] = ans

  ans
end

# @param {String} s
# @return {Integer}
def longest_palindrome_subseq(s)
  @dp = Array.new(s.length) { Array.new(s.length, nil) }

  rec_pali(0, s.length - 1, s)
end

# s = "bbbab"
# p longest_palindrome_subseq(s)
#
#
# s = "bbba"
# p longest_palindrome_subseq(s)
#
#
# s = "cbbd"
# p longest_palindrome_subseq(s)
#
#
s = "mabcvbadszx"
p longest_palindrome_subseq(s)

# 'baab'

