s = 0

start = Time.now
s += Time.now - start
p s

# [[0,1],[1,2],[1,3],[3,4]]


# [[3, 4], [1, 2]]
# [[1, 3], [1, 2]]
# [[1, 3], [3, 4]]
# [[0, 1], [1, 2]]
# [[0, 1], [3, 4]]
# [[0, 1], [1, 3]]


# 0: 1 = 0^[1]^[3]^[4]^[2]^[6], 5 = 0^[5]
# 1: 3 = 0^[3]^[4], 0 = 0^[0]^[5], 2 = 0^[2]^[6]

# 173292

# [19,12,1,27,12]
#[[2,3],[4,2],[1,3],[0,3]]













[[0,6],[0,4],[6,8],[4,3],[4,1],[0,7],[9,6],[6,5],[10,6],[2,9]]





# (0...(edges.length - 1)).each do |first_index|
#   first_edge = edges[first_index]
#   xor1 = get_neighbors(first_edge[0], first_edge[1], map, nums)
#   reverse = false
#   ((first_index + 1)...edges.length).each do |second_index|
#     second_edge = edges[second_index]
#
#     if first_edge[0] == second_edge[0]
#       xor1 = get_neighbors(first_edge[1], first_edge[0], map, nums)
#       reverse = true
#     end
#
#     # q = reverse ? first_edge.reverse : first_edge
#     #
#     # xor1 = get_neighbors(q[0], q[1], map, nums)
#
#
#     p '-----------'
#
#     if reverse
#       p 'reverse'
#       p [first_edge.reverse, second_edge]
#       p "...#{first_edge[1]} | #{first_edge[0]}...#{second_edge[0]} | #{second_edge[1]}... "
#     else
#       p [first_edge, second_edge]
#       p "...#{first_edge[0]} | #{first_edge[1]}...#{second_edge[0]} | #{second_edge[1]}... "
#     end
#
#     xor3 = get_neighbors(second_edge[1], second_edge[0], map, nums)
#
#
#     arr = [xor1, all_xor ^ xor1 ^ xor3, xor3]
#
#     p arr
#     min = arr.max - arr.min
#     minimum = min if minimum.nil? || minimum > min
#
#     p '!!!!!!!!!!!!!!!!!!!!!!!!!!' if min == 5
#     # p arr
#   end
# end


























# graph[node].keys.each do |neighbor|
#   next if neighbor == parent
#
#   sum = ""
#
#   neighbors_xors.each_with_index do |n, i|
#     next if i == neighbor
#
#     sum += "^#{n}"
#   end
#
#   p "sum: #{sum}"
#   p "aasasass: #{sum}^#{nums[node]}"
#   graph[neighbor][node] = "#{sum}^#{nums[node]}"
# end








# graph_map = Array.new(nums.length) {Array.new(nums.length, 0)}
#
# edges.each do |con|
#   graph_map[con[0]][con[1]] ^= nums[con[1]]
#   graph_map[con[1]][con[0]] ^= nums[con[0]]
# end
#
# p graph_map

# graph = edges.clone

# xors_all = nums.reduce(0) {|acc, curr| acc = acc^curr; acc}
# first_xor = 0
# last_xor = xors_all
# nums = nums.map{|edge| edge.sort}
# p "xors_all: #{xors_all}"




# def get_min_xor(node, parent, graph, nums, array = [], res = [])
#   # p "!!!!!!node: #{node}, #{parent}: parent"
#   # p "map[node]: #{graph[node]}"
#   # p "******************" if node == 2
#   # node_xor = get_neighbors(node, parent, graph, nums)
#   # p "!!!!!!node_xor: #{node_xor}"
#
#   graph[node].keys.each do |neighbor|
#     next if neighbor == parent
#
#     # neighbor_xor = get_neighbors(node, neighbor, graph, nums)
#     # first_xor = "#{node_xor} ^ #{neighbor_xor}"
#
#     p '---------before'
#     p "neighbor: #{neighbor} node: #{node}"
#
#     edge = get_min_xor(neighbor, node, graph, nums, array, res)
#
#     p '---------after'
#     p "edges: #{edges}"
#     p "res: #{res}"
#
#     p "node: #{node} neighbor: #{neighbor}"
#     # p edges
#     # p "third_xor: #{third_xor}"
#     # p [first_xor, "#{neighbor_xor} ^ #{third_xor}", third_xor]
#
#     edges.each do |e|
#       array.push [[node, neighbor], e] if [node, neighbor] != e.reverse
#     end
#     # p "array: #{array}"
#     # p '---------end'
#     res = []
#
#   end
#
#   [node, parent] if parent
#   # nums
# end



# (0...(edges.length - 1)).each do |first_index|
#   first_edge = edges[first_index]
#
#   first_xor = first_xor^first_edge[1]
#
#   ((first_index + 1)...edges.length).each do |second_index|
#     second_edge = edges[second_index]
#     graph = edges.clone
#
#     graph.delete(first_edge)
#     graph.delete(second_edge)
#
#
#     p '------------'
#     p graph
#
#
#     # [{node_i: xors_sum}...]
#     map = Array.new(nums.length) {{}}
#
#     p graph
#     graph.each do |con|
#       map[con[0]].push con[1]
#       map[con[1]].push con[0]
#     end
#     p map
#
#     graph_calc_xors(0, map, nums)
#   end
# end