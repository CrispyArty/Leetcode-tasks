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
  s = 0
  start = Time.now

  map = Array.new(nums.length) { {} }

  edges.each do |con|
    map[con[0]][con[1]] = 0
    map[con[1]][con[0]] = 0
  end

  s += Time.now - start
  p s

  start = Time.now

  map.each_index do |node|
    calc_xors(node, nil, map, nums)
  end

  s += Time.now - start
  p s

  all_xor = nums.reduce(0) do |acc, curr|
    acc ^= curr
    acc
  end


  minimum = 10 ** 8

  start = Time.now

  edges = get_edges(0, nil, map)
  # p edges

  s += Time.now - start
  p s

  s1 = s2 = s3 = 0

  start = Time.now

  i = 0
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
      start1 = Time.now

      xor2 = all_xor ^ xor1 ^ xor3

      arr = [xor1, xor2, xor3]

      min = arr.max - arr.min
      minimum = min if minimum > min

      s1 += Time.now - start1
    end
  end


  s += Time.now - start
  p "s: #{s}"
  p "s1: #{s1}"
  p "s2: #{s2}"
  p "s3: #{s3}"

  p i
  minimum
end

# nums = [1, 5, 5, 4, 11]
# edges = [[0, 1], [1, 2], [1, 3], [3, 4]]
# p minimum_score(nums, edges)


# nums = [28,24,29,16,31,31,17,18]
# edges = [[0,1],[6,0],[6,5],[6,7],[3,0],[2,1],[2,4]]
#
# p minimum_score(nums, edges)


# nums = [15, 20, 18, 16, 30, 5, 26, 3, 21, 29]
# edges = [[5, 8], [3, 5], [5, 7], [5, 4], [4, 6], [5, 2], [3, 0], [1, 0], [7, 9]]
# p minimum_score(nums, edges)


# nums = [19,12,1,27,12]
# edges = [[2,3],[4,2],[1,3],[0,3]]
# p minimum_score(nums, edges)


# nums = [19,12,1,27,12, 12]
# edges = [[2,3],[4,2],[1,3],[0,3],[1,5]]
# p minimum_score(nums, edges)


# nums = [23,1,5,7,16,5,4,28,5,5,2]
# edges = [[0,6],[0,4],[6,8],[4,3],[4,1],[0,7],[9,6],[6,5],[10,6],[2,9]]
# p minimum_score(nums, edges)