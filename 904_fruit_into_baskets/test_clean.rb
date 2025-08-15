# @param {Integer[]} fruits
# @return {Integer}
def total_fruit(fruits)
  last_fruit = [fruits[0], 0]
  last_types = {}

  left = max = 0
  fruits.each_index do |right|
    last_types[fruits[right]] = true
    if last_types.length > 2
      last_types = { last_fruit[0] => true, fruits[right] => true }

      left = last_fruit[1]
    end
    max = [right - left + 1, max].max

    last_fruit = [fruits[right], right] if last_fruit[0] != fruits[right]
  end

  max
end
