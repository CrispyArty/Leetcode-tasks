def min_cost(basket1, basket2)
  min_fruit_cost = (1 << 31)
  hash_shared = Hash.new(0)

  (0...basket1.length).each do |n|
    hash_shared[basket1[n]] += 1
    hash_shared[basket2[n]] -= 1
    min_fruit_cost = basket1[n] if min_fruit_cost > basket1[n]
    min_fruit_cost = basket2[n] if min_fruit_cost > basket2[n]
  end

  keys = []

  hash_shared.each do |key, value|
    return -1 if value.odd?
    next if value.zero?

    count_of_changes = value / 2

    count_of_changes.abs.downto(1).each do
      keys.push key
    end
  end

  keys.sort!

  min_fruit_cost_double = min_fruit_cost * 2
  full_cost = 0
  (0...(keys.length / 2)).each do |i|
    full_cost += [min_fruit_cost_double, keys[i]].min
  end

  full_cost
end
