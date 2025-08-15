# @param {Integer[]} fruits
# @return {Integer}
def total_fruit(fruits)

  last_fruit = [fruits[0], 0]
  last_types = {}

  left = max = 0
  # [0, 1, 2, 2]
  # [1, 1, 2, 2, 1, 2, 3, 2, 2]
  # [1, 2, 3, 2, 2]
  p fruits
  fruits.each_index do |right|
    last_types[fruits[right]] = true
    p '----------------'

    p "last_types: #{last_types}"
    if last_types.length > 2
      last_types = { last_fruit[0] => true, fruits[right] => true }

      p '!~~~~~~~~~~~~~~~~~~~~~~~~~~'
      p "!!!!!!!!!right: #{right} - left: #{left} | last_fruit: #{last_fruit}"
      left = last_fruit[1]
    end
    p "last_types_after: #{last_types}"
    p "right: #{right} - left: #{left} | last_fruit: #{last_fruit}"
    p [right - left + 1, max]
    max = [right - left + 1, max].max

    last_fruit = [fruits[right], right] if last_fruit[0] != fruits[right]
  end

  max
end

# fruits = [0, 1, 2, 2]
# p total_fruit(fruits)

# fruits = [1, 1, 2, 2, 1, 2, 3, 2, 2]
# p total_fruit(fruits)

# fruits = [1, 2, 1, 3, 2, 2]
# p total_fruit(fruits)

# fruits = [1,9,1,8,22,0,22,19,19,2,19,6,6,19,2,20,2,9,9,9,9,16,19,16,19,11,19,0,19,19]
# p total_fruit(fruits)

fruits = [2, 20, 2, 9, 9, 9, 9, 16]
p total_fruit(fruits)

