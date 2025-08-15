require_relative "test"

def assert(actual, expected)
  throw "actual!=expected: #{actual} != #{expected}" if actual != expected

  true
end

s = "mississippi"
p = "mis*is*ip*."
assert(is_match(s, p), true)


s = "a"
p = "ab*b*b*b*b*b*b*b*b*"
assert(is_match(s, p), true)



s = "aabcbcbcaccbcaabc"
p = ".*a*aa*.*b*.c*.*a*"

assert(is_match(s, p), true)


s = "aabcbcbcaccbcaabc"
p = ".*ab*."

assert(is_match(s, p), true)




s = "mississippi"
p = "mississippi"
assert(is_match(s, p), true)



s = "aa"
p = "a"
assert(is_match(s, p), false)



s = "aa"
p = "a*"
assert(is_match(s, p), true)


s = "ab"
p = ".*c"
assert(is_match(s, p), false)



s = "a"
p = "ab*"
assert(is_match(s, p), true)



s = "abasdasdasdasd"
p = ".*c"
assert(is_match(s, p), false)


s = "abasdasdasdasdc"
p = ".*c"
assert(is_match(s, p), true)



s = "abcd"
p = "d*"
assert(is_match(s, p), false)



s = "aaa"
p = "aaaa"
assert(is_match(s, p), false)

