
start = Time.now
s = 0
s += Time.now - start

p s




# [[0,1],[1,2],[2,0],[1,3],[3,4],[4,5],[5,3]]


# 0,1
# 0,1,2






#
# con = connections[0]
# cycles = [con]
# p con
# p find_cycle(con[1], con, connections, cycles, {})
# p cycles






# [[0,1],[1,2],[2,0],[1,3],[3,4],[4,5],[5,3]]


# [[1,0],[2,0],[3,2],[4,2],[4,3],[3,0],[4,0]]












# def find_all_cycle(start_node, edge, connections, graph, depth = 0, visited = [])
#   return visited[start_node] unless visited[start_node].nil?
#
#   visited[start_node] = depth
#
#   min_back_depth = 10_000
#
#   edges_related_to_node(graph, start_node, edge).each do |g_edge|
#     next_node = (g_edge[0] === start_node) ? g_edge[1] : g_edge[0]
#
#     back_node = find_all_cycle(next_node, g_edge, connections, graph, depth + 1,  visited)
#
#     connections.delete(g_edge) if back_node <= depth
#
#     min_back_depth = [min_back_depth, back_node].min
#   end
#
#   min_back_depth
# end


















# if visited[next_node].nil?
#   if find_all_cycle(next_node, g_edge, connections, graph, depth,  visited)
#     p '------------1'
#     p "start_node, edge: #{start_node}, #{edge}"
#     p "g_edge: #{g_edge}"
#     p "visited: #{visited}"
#     p "next_node: #{next_node}"
#     p "visited[next_node]: #{visited[next_node]}"
#
#     p g_edge
#     found_cycle = true
#     connections.delete(g_edge)
#   end
# elsif visited.length > 2 && visited[next_node]
#   p '------------2'
#   p g_edge
#   connections.delete(g_edge)
#
#   found_cycle = true
# end




# map = Array.new(n) {[]}
# connections.each do |con|
#   map[con[0]].push con[1]
#   map[con[1]].push con[0]
# end





# def critical_connections(n, connections)
#   # criticals = []
#
#   is_circle = false
#
#   criticals = connections.clone
#   i = 0
#   while i < criticals.length
#     con = criticals[i]
#
#     circle_cons = [con]
#
#     node = con[1]
#     p '=========================='
#     p con
#     connections.each do |circle_con|
#       p '---------'
#
#       next if circle_con == con
#       p "circle_con: #{circle_con}"
#       p "node: #{node}"
#
#       next unless circle_con.include?(node)
#
#       p "!!!!! 1"
#
#       circle_cons.push circle_con
#
#       p "circle_con - [node]: #{circle_con - [node]}"
#       _next =  (circle_con - [node])[0]
#
#       if _next == con[0]
#         p "!!!!! 2"
#         is_circle = true
#         break
#       end
#
#       node = _next
#     end
#
#     p '00000000000'
#     p criticals
#
#     criticals = criticals - circle_cons if is_circle
#     p criticals
#     p i
#
#     i += 1 unless is_circle
#     is_circle = false
#   end
#
#   # map = Array.new(n) {Array.new(n, 0)}
#   #
#   # p map
#   # connections.each do |con|
#   #   map[con[0]][con[1]] += 1
#   #   map[con[1]][con[0]] += 1
#   # end
#
#   criticals
# end











#def critical_connections(n, connections)
#   # criticals = []
#
#   is_circle = false
#   @connections = connections
#   criticals = connections.clone
#
#   i = 0
#   while i < criticals.length
#     con = criticals[i]
#     p '---------'
#
#     circle_cons = []
#
#     p con
#     p "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
#
#     fetch_circle_connections(con, con[1], circle_cons)
#
#
#     unless circle_cons.empty?
#       circle_cons.push con
#
#       p "circle_cons: #{circle_cons}"
#       p ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
#
#       criticals = criticals - circle_cons
#       next
#     end
#
#     i += 1
#
#     # criticals = criticals - circle_cons if is_circle
#
#     i += 1
#   end
#
#   criticals
# end


















#def critical_connections(n, connections)
#
#   start = Time.now
#   s = 0
#   p connections.length
#   criticals = connections.clone
#   i = 0
#
#
#   while i < criticals.length
#     con = criticals[i]
#     cycles = [con]
#     # p con
#     found = find_cycle(con[1], con, connections, cycles, {})
#
#
#     s += Time.now - start
#     p criticals.length
#     p s
#
#     if found
#       p '--------'
#       p cycles
#
#       criticals = criticals - cycles
#       next
#     end
#
#     i += 1
#   end
#
#
#   s += Time.now - start
#   p s
#
#   criticals
# end