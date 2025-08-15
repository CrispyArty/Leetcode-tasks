
def edges_related_to_node(graph, node, exception_edge)
  graph.filter{|_e| exception_edge != _e && _e.include?(node)}
end



# def find_cycle(start_node, edge, graph, cycles, visited = {})
#   visited[edge[0]] = true # if visited[edge[0]].nil?
#   visited[edge[1]] = true # if visited[edge[1]].nil?
#
#   found_circle = true
#
#   edges_related_to_node(graph, start_node, edge).each do |g_edge|
#     next_node = (g_edge[0] === start_node) ? g_edge[1] : g_edge[0]
#
#     if visited[next_node].nil?
#       if find_cycle(next_node, g_edge, graph, cycles, visited)
#         cycles.push(g_edge)
#         return true
#       end
#     elsif visited.length > 2 && visited.first[0] == next_node
#       cycles.push(g_edge)
#       return true
#     end
#
#   end
#
#   false
# end


def find_all_cycle(start_node, connections, graph_map, depth = 0, visited = [])

  return visited[start_node] if visited[start_node] >= 0

  visited[start_node] = depth

  min_back_depth = 10_000

  graph_map[start_node].each do |neighbor|
    next if visited[neighbor] == depth - 1

    back_node = find_all_cycle(neighbor, connections, graph_map, depth + 1,  visited)

    connections.push([start_node, neighbor].sort) if back_node <= depth

    min_back_depth = [min_back_depth, back_node].min

  end

  min_back_depth
end



def find_all_cycle1(start_node, edge, connections, graph, depth = 0, visited = [])
  return visited[start_node] unless visited[start_node].nil?

  visited[start_node] = depth

  min_back_depth = 10_000

  edges_related_to_node(graph, start_node, edge).each do |g_edge|
    next_node = (g_edge[0] === start_node) ? g_edge[1] : g_edge[0]

    back_node = find_all_cycle1(next_node, g_edge, connections, graph, depth + 1,  visited)

    connections.delete(g_edge) if back_node <= depth

    min_back_depth = [min_back_depth, back_node].min
  end

  min_back_depth
end



# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer[][]}
def critical_connections(n, connections)
  sorted_edges = connections.map {|c| c.sort }

  map = Array.new(n) {[]}
  connections.each do |con|
    map[con[0]].push con[1]
    map[con[1]].push con[0]
  end

  edges_in_cycles = []
  find_all_cycle(0, edges_in_cycles, map, 0, Array.new(n, -2))

  sorted_edges - edges_in_cycles
end

# connections = [[0,1],[1,2],[2,0],[1,3]]
# n = 4
# p critical_connections(n, connections)


# connections = [[0,1]]
# n = 2
# p critical_connections(n, connections)


connections = [[0,1],[1,2],[2,0],[1,3],[3,4],[4,5],[5,3]]
n = 6
p critical_connections(n, connections)

# connections = [[0,1],[1,2],[2,0],[1,3],[3,4], [4,5], [5,3]]
# n = 6
# p critical_connections(n, connections)

connections = [[1,0],[2,0],[3,2],[4,2],[4,3],[3,0],[4,0]]
n = 5
p critical_connections(n, connections)

