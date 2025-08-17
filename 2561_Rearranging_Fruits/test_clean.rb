# @param {Integer[]} basket1
# @param {Integer[]} basket2
# @return {Integer}
def min_cost(basket1, basket2)
  hash1 = {}
  hash2 = {}
  min_fruit_cost = (1 << 31)

  basket1.each do |b|
    hash1[b] = (hash1[b] || 0) + 1
    min_fruit_cost = b if min_fruit_cost > b
  end

  basket2.each do |b|
    if hash1[b]
      hash1[b] -= 1
      hash1.delete(b) if hash1[b] == 0
    else
      hash2[b] = (hash2[b] || 0) + 1
    end

    min_fruit_cost = b if min_fruit_cost > b
  end

  return 0 if hash1.empty?

  cost = 0

  hash1 = hash1.sort.to_a
  hash2 = hash2.sort.to_a

  j = hash2.length - 1
  i = 0
  min_fruit_cost_double = min_fruit_cost * 2

  while j >= 0 && i < hash1.length
    return -1 if hash1[i][1].odd? || hash2[j][1].odd?

    min_value = [hash1[i][0], hash2[j][0]].min
    diff = hash1[i][1] - hash2[j][1]

    min_value = min_fruit_cost_double if min_value > min_fruit_cost_double

    if diff == 0
      cost += min_value * (hash1[i][1] / 2)
      hash1[i][1] = hash2[j][1] = 0

      i += 1
      j -= 1
    elsif diff > 0
      cost += min_value * (hash2[j][1] / 2)
      hash1[i][1] -= hash2[j][1]

      hash2[j][1] = 0
      j -= 1
    else
      cost += min_value * (hash1[i][1] / 2)
      hash2[j][1] -= hash1[i][1]
      hash1[i][1] = 0
      i += 1
    end
  end

  return -1 unless j == -1 && i == hash1.length

  cost
end


