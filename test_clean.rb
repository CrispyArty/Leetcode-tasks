# @param {String} str1
# @param {String} str2
# @return {String}
def shortest_common_supersequence(str1, str2)
  longer_str, shorter_str = str1.length >= str2.length ? [str1, str2] : [str2, str1]
  i = j = 0
  longer_str.length.times do |k|
    if longer_str[k] == shorter_str[j]
      j += 1
    end

    return longer_str if j == shorter_str.length
  end

  post = shorter_str[j..]

  j = shorter_str.length - 1
  (longer_str.length - 1).downto(0) do |i|
    if longer_str[i] == shorter_str[j]
      j -= 1
    end
  end

  pre = shorter_str[0..j]

  if pre.length < post.length
    pre + longer_str
  else
    longer_str + post
  end
end

