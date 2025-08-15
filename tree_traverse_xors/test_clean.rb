def calc_xors(node, parent, graph, nums)
  if graph[node].length == 1 && !parent.nil?
    return nums[node]
  end

  neighbors_xors = 0

  graph[node].each do |neighbor|
    next if neighbor[0] == parent

    neighbor_xor = neighbor[1]

    if neighbor_xor == 0
      neighbor_xor = calc_xors(neighbor[0], node, graph, nums)
      graph[node][neighbor[0]] = neighbor_xor
    end

    neighbors_xors ^= neighbor_xor
  end

  neighbors_xors ^ nums[node]
end

def get_edges(node, parent, graph, edges = [])
  length = graph[node].length
  return edges if length == 1 && !parent.nil?

  i = 0
  max = (parent.nil? ? length : length - 1)

  graph[node].each do |neighbor|
    next if neighbor[0] == parent
    edges.push [node, neighbor[0]]

    get_edges(neighbor[0], node, graph, edges)

    i += 1
    if i == max
      edges.push [node, nil]
    end
  end


  edges
end


# @param {Integer[]} nums
# @param {Integer[][]} edges
# @return {Integer}
def minimum_score(nums, edges)
  map = Array.new(nums.length) { {} }

  edges.each do |con|
    map[con[0]][con[1]] = 0
    map[con[1]][con[0]] = 0
  end

  map.each_index do |node|
    calc_xors(node, nil, map, nums)
  end

  all_xor = nums.reduce(0) do |acc, curr|
    acc ^= curr
    acc
  end

  edges = get_edges(0, nil, map)

  minimum = 10 ** 8

  (0...(edges.length - 1)).each do |first_index|
    first_edge = edges[first_index]
    next if first_edge[1].nil?

    xor1 = map[first_edge[1]][first_edge[0]]
    reverse = false

    ((first_index + 1)...edges.length).each do |second_index|
      second_edge = edges[second_index]

      if first_edge[0] == second_edge[0] && !reverse
        xor1 = nil
        reverse = true
      end

      next if second_edge[1].nil?

      if reverse && xor1.nil?
        xor1 = map[first_edge[0]][first_edge[1]]
      end

      xor3 = map[second_edge[0]][second_edge[1]]
      arr = [xor1, all_xor ^ xor1 ^ xor3, xor3]
      min = arr.max - arr.min
      minimum = min if minimum > min

    end
  end


  minimum
end
