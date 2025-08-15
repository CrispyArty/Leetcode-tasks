require_relative "test"

def assert(actual, expected)
  throw "actual!=expected: #{actual} != #{expected}" if actual != expected

  true
end

