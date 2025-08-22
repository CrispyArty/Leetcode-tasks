s = 0
start = Time.now
s += Time.now - start
p s



#def shortest_common_supersequence(str1, str2)
#   longer_str, shorter_str = str1.length > str2.length ? [str1, str2] : [str2, str1]
#
#
#
#   pre_length = 0
#   # pre length
#   (0...shorter_str.length).each do |i|
#     p '----------'
#     p "shorter_str[i..]: #{shorter_str[i..]}"
#     p "longer_str[0..(shorter_str.length - i)]: #{longer_str[0...(shorter_str.length - i)]}"
#     if shorter_str[i..] == longer_str[0...(shorter_str.length - i)]
#       pre_length = shorter_str.length - i
#       break
#     end
#     # str
#   end
#
#
#   post_length = 0
#   # if short str in longer str
#   (0...longer_str.length).each do |i|
#
#     post_length = 0
#     while post_length < shorter_str.length && longer_str[i + post_length] == shorter_str[post_length]
#       post_length += 1
#     end
#
#     return longer_str if post_length == shorter_str.length
#
#     p "post_length: #{post_length} | longer_str.length - i: #{longer_str.length - i}"
#     break if post_length == longer_str.length - i
#   end
#
#   p "pre_length: #{pre_length}"
#   p "post_length: #{post_length}"
#
#   if pre_length > post_length
#     shorter_str + longer_str[pre_length..]
#   else
#     longer_str + shorter_str[post_length..]
#   end
# end



#


# str1 = "bbababbb"
# str2 = "bbbaaaba"
# bbbaaababbb

# bbababbb

# b-1 b-1 a0 b-1 a-1 b0 b0 b0


# bbababbbaba
# bbbaaaba


# bcacaaababaccc
# bbabcacccaaab











# "text1: [\"a\", \"b\", \"c\", \"d\", \"e\"], text2: [\"a\", \"c\", \"e\"]"
# "text1: [\"b\", \"c\", \"d\", \"e\"], text2: [\"c\", \"e\"]"
# "text1: [\"b\", \"c\", \"d\", \"e\"], text2: [\"e\"]"
# "text1: [\"c\", \"d\", \"e\"], text2: [\"e\"]"
# "text1: [\"d\", \"e\"], text2: [\"e\"]"
# "text1: [\"e\"], text2: [\"e\"]"
# "text1: [\"c\", \"d\", \"e\"], text2: [\"c\", \"e\"]"
# "text1: [\"d\", \"e\"], text2: [\"e\"]"
# "text1: [\"e\"], text2: [\"e\"]"
