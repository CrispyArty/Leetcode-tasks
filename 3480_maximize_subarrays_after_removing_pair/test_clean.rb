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

    if q < pair_diff
      smallest_pair = pair
      pair_diff = q
    end
  end

  pair_map.delete(smallest_pair)


  max_sub = 0
  (1..n).reverse_each do |num|
    hash = {}
    subs_count = num
    sub_length = n - num + 1

    pair_map.each do |pair, params|
      to_remove = sub_length - params[:diff]
      next if to_remove <= 0


      r_start = pair[0] - (sub_length - params[:diff]) + 1
      r_start = 1 if r_start < 1

      r_end = r_start + to_remove
      r_end = subs_count + 1 if r_end > subs_count + 1

      (r_start...r_end).each do |index|
        hash[index] = true
      end
    end

    max_sub += subs_count - hash.keys.length
  end

  max_sub
end