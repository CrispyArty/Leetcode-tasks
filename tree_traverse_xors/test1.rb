def calc_xors(node, parent, graph, nums)
  p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  p node

  if graph[node].length == 1 && !parent.nil?
    return "#{nums[node]}"
  end

  p "continue"

  # xors = 0
  neighbors_xors = []

  graph[node].keys.each do |neighbor|
    next if neighbor == parent
    p "#{node}----------#{graph[node]}"
    neighbor_xor = graph[node][neighbor]

    p "neighbor_xor: #{neighbor_xor}"
    if neighbor_xor == 0
      neighbor_xor = calc_xors(neighbor, node, graph, nums)
      graph[node][neighbor] = "#{neighbor_xor}"
    end

    neighbors_xors[neighbor] = neighbor_xor
    # xors = "#{xors} ^ #{neighbor_xor}"
  end

  # unless parent.nil?
  #   graph[node][parent] = calc_xors(parent, node, graph, nums)
  # end

  total = neighbors_xors.reduce("0") do|acc, curr|
    acc = "#{acc}^#{curr}" if curr
    acc
  end + "^#{nums[node]}"

  # total = "#{xors} ^ #{nums[node]}"
  p node
  p neighbors_xors

  p total

  total
  # xors ^ nums[node]
end

def get_neighbors(neighbors, except_node)
  neighbors.keys.reduce("0") do|acc, curr|
    acc = "#{acc}^#{neighbors[curr]}" unless except_node.include?(curr)
    # if curr != except_node
    acc
  end
end

def find_edge_node(node, map, end_edge, parent = nil)
  return node if end_edge.include?(node)

  p "find_edge_node: #{node} #{parent}"
  map[node].keys.each do |neighbor|
    next if neighbor == parent

    res = find_edge_node(neighbor, map, end_edge, node)

    return res if res
  end

  nil
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
    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#{node}"
    calc_xors(node, nil, map, nums)
  end
  p map


  all_xor = nums.reduce("0") do |acc, curr|
    acc += "^#{curr}"
    acc
  end

  minimum = 0

  (0...(edges.length - 1)).each do |first_index|

    first_edge = edges[first_index]

    ((first_index + 1)...edges.length).each do |second_index|
      p '~~~~~~~~~~~~~~~~~'
      second_edge = edges[second_index]

      # first_graph_node = first_edge[0]

      edge_node = find_edge_node(first_edge[0], map, second_edge, first_edge[1])


      # if edge_node.nil?
      #   first_graph_node = first_edge[1]
      #   edge_node = find_edge_node(first_graph_node, map, second_edge, first_edge[0])
      # end

      p "edge_node: #{edge_node}"
      if edge_node
        edge_node_index = second_edge[0] == edge_node ? 0 : -1

        exceptions = [first_edge[0], second_edge[0], second_edge[1] ]

        first_xor = get_neighbors(map[first_edge[1]], exceptions) + " ^ #{nums[first_edge[1]]}"


        exceptions = [second_edge[edge_node_index], first_edge[0], first_edge[1] ]

        third_xor = get_neighbors(
                      map[second_edge[edge_node_index + 1]],
                      exceptions
                    ) + " ^ #{nums[second_edge[edge_node_index + 1]]}"

        second_xor = "#{all_xor} ^ #{first_xor} ^ #{third_xor}"
      else
        edge_node = find_edge_node(first_edge[1], map, second_edge, first_edge[0])

        p "edge_node: #{edge_node}"
        p "map[first_edge[1]]: #{map[first_edge[1]]}"
        p "first_edge: #{first_edge}"

        edge_node_index = second_edge[0] == edge_node ? 0 : -1

        exceptions = [first_edge[1], second_edge[0], second_edge[1] ]

        first_xor = get_neighbors(map[first_edge[0]], exceptions) + " ^ #{nums[first_edge[0]]}"

        p "edge_node_index + 1: #{edge_node_index + 1}"
        p "second_edge: #{second_edge}"
        p "map[second_edge[edge_node_index + 1]]: #{map[second_edge[edge_node_index + 1]]}"

        exceptions = [second_edge[edge_node_index], first_edge[0], first_edge[1] ]

        third_xor = get_neighbors(
                      map[second_edge[edge_node_index + 1]],
                      exceptions
                    ) + " ^ #{nums[second_edge[edge_node_index + 1]]}"

        second_xor = "#{all_xor} ^ #{first_xor} ^ #{third_xor}"
      end

      # arr = [first_xor, second_xor, third_xor]
      #
      # arr.min

      p [first_xor, second_xor, third_xor]
      p [first_edge, second_edge]

      # min = [first_xor, second_xor, third_xor].max - [first_xor, second_xor, third_xor].max
      # minimum = min if minimum.nil? || minimum > min
    end
  end
  p map

  minimum
end

# nums = [1, 5, 5, 4, 11]
# edges = [[0, 1], [1, 2], [1, 3], [3, 4]]
# p minimum_score(nums, edges)



nums = [15,20,18,16,30,5,26,3,21,29]
edges = [[5,8],[3,5],[5,7],[5,4],[4,6],[5,2],[3,0],[1,0],[7,9]]
p minimum_score(nums, edges)