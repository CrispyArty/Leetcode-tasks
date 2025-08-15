# @param {Integer} n
# @param {Integer[][]} conflicting_pairs
# @return {Integer}
def max_subarrays(n, conflicting_pairs)
  smallest_pair = nil
  pair_diff = 10**5 + 1
  pair_map = {}

  conflicting_pairs.each do |p|
    pair = p[1] > p[0] ? p : p.reverse

    diff = (pair[1] - pair[0]).abs

    pair_map[pair] = {
      diff: diff,
      min_edge: [n - pair[1], pair[0] - 1].min + 1
    }

    q = diff - pair_map[pair][:min_edge]

    p "q: #{q} | diff: #{diff} | pair_map[pair][:min_edge]: #{pair_map[pair][:min_edge]} | pair #{pair}"

    if q < pair_diff
      smallest_pair = pair
      pair_diff = q
    # elsif diff == pair_diff
    #   smallest_pair = pair if pair_map[smallest_pair][:min_edge] < pair_map[pair][:min_edge]
    end
  end

  # pair_map.delete(smallest_pair)
  # pair_map.delete([5, 9])
  # pair_map.delete([10, 18])

  # p "conflicting_pairs: #{conflicting_pairs}"
  p "smallest_pair: #{smallest_pair}"
  p "pair_map: #{pair_map}"
  # return


  ans = 0

  conflicting_pairs.each do |pair|

  end


  max_sub = 0
  # 1 + 2 + 3 + 4 = 10
  (1..n).reverse_each do |num|
    hash = {}
    subs_count = num
    sub_length = n - num + 1

    p '-----------------------'
    p "subs_count: #{subs_count} sub_length: #{sub_length}"

    pair_map.each do |pair, params|
      to_remove = sub_length - params[:diff]

      next if to_remove <= 0

      # to_remove = params[:min_edge] if to_remove > params[:min_edge]
      p "params: #{params} pair: #{pair}"
      # p "to_remove: #{to_remove}"

      # !!!!!!!!!!!
      # r_start = pair[0] - to_remove + 1
      # r_start = 1 if r_start < 1
      # !!!!!!!!!!!!


      r_start = pair[1] - sub_length + 1
      r_start = 1 if r_start < 1

      # d = sub_length - pair[1]

      # r_end = r_start + to_remove - (d > 0 ? d : 0)

      r_end = pair[0]
      r_end = subs_count if r_end > subs_count
      # r_end = 2 if r_end < 1

      p "range: #{(r_start..r_end)}"

      (r_start..r_end).each do |index|
        hash[index] = true
      end
    end

    p "hash: #{hash}"
    max_sub += subs_count - hash.keys.length
  end
  # p "max_sub: #{max_sub}"
  # p n * (n+1) / 2

  max_sub
end



n = 20
conflicting_pairs = [[5,9],[10,18],[10,14]]
p max_subarrays(n, conflicting_pairs)


# n = 20
# conflicting_pairs = [[5,9],[5,9],[10,14]]
# p max_subarrays(n, conflicting_pairs)


# n = 20
# conflicting_pairs = [[12,7],[9,11]]
# p max_subarrays(n, conflicting_pairs)



# n = 10
# conflicting_pairs = [[4,2],[9,3]]
# p max_subarrays(n, conflicting_pairs)


# n = 4
# conflicting_pairs = [[2,3],[1,4]]
# p max_subarrays(n, conflicting_pairs)


# n = 5
# conflicting_pairs = [[1,2],[2,5],[3,5]]
# p max_subarrays(n, conflicting_pairs)


# [1,2,3,4]
# [1] [2] [3] [4]
# [1,2] [2,3] [3,4]
# [1,2,3], [2,3,4]
# [1,2,3,4]

# 1 + 2 + 3 + 4
# 10
# n*(n+1)/2
# 4 * (4 + 1) / 2 = 20 / 2 = 10


# n = 6
# conflicting_pairs = [[1,2],[5,6]]
# p max_subarrays(n, conflicting_pairs)

# n = 20
# conflicting_pairs = [[20,19],[10,7]]
# p max_subarrays(n, conflicting_pairs)


# n = 10
# conflicting_pairs = [[5,10],[3,8]]
# p max_subarrays(n, conflicting_pairs)


# n = 5
# conflicting_pairs = [[1,2],[2,5],[3,5]]
# p max_subarrays(n, conflicting_pairs)
# [1,2,3,4,5]
# [1] [2] [3] [4] [5] - 0
# [1,2] [2,3] [3,4] [4,5] - 0
# [1,2,3] [2,3,4] [3,4,5] - 1
# [1,2,3,4] [2,3,4,5] - 1
# [1,2,3,4,5] - 1

# ex = [2,5] [3,5]

# 5 * (5 + 1) / 2 = 30 / 2 = 15 - 3 = 12




# n = 6
# conflicting_pairs = [[1,2],[2,4],[3,5]]
# p max_subarrays(n, conflicting_pairs)
# n = 6
# conflicting_pairs = [[1,2],[2,4],[3,5]]
# [1,2,3,4,5,6]
# [1] [2] [3] [4] [5] [6] - 0
# [1,2] [2,3] [3,4] [4,5] [5,6] - 0
# [1,2,3] [2,3,4] [3,4,5] [4,5,6] - 2
# [1,2,3,4] [2,3,4,5] [3,4,5,6] - 3
# [1,2,3,4,5] [2,3,4,5,6] - 1
# [1,2,3,4,5,6] - 1

# 1...3

# 6 * (6 + 1) / 2 = 42 / 2 = 21
# 21 - (1 + 1 + 3 + 2) = 21 - 7 = 14




# ex = [2,4] - [2,3,4] | [1,2,3,4] [2,3,4,5] | [1,2,3,4,5] [2,3,4,5,6] | [1,2,3,4,5,6]
# ex = [3,5] - [3,4,5] | [2,3,4,5] [3,4,5,6] | [1,2,3,4,5] [2,3,4,5,6] | [1,2,3,4,5,6]
# ex = [4,6]
# min_edge = [11 - 6, 4 - 1].min + 1 = 4
# ex [5,7] -

# 1 + 2 + 3 + 4
# 10
# n*(n+1)/2
# 4 * (4 + 1) / 2 = 20 / 2 = 10





