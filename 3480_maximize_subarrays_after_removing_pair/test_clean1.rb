# @param {Integer} n
# @param {Integer[][]} conflicting_pairs
# @return {Integer}
def max_subarrays(n, conflicting_pairs)
  pair_map = {}

  conflicting_pairs.each do |p|
    pair = p[1] > p[0] ? p : p.reverse
    diff = (pair[1] - pair[0]).abs

    pair_map[p] = {
      pair: pair,
      diff: diff,
    }
  end

  ans = 0

  pair_map.keys.each do |ex_pair_key|
    max_sub = 0
    (1..n).reverse_each do |num|
      hash = {}
      subs_count = num
      sub_length = n - num + 1

      pair_map.each do |pair_key, params|
        next if ex_pair_key == pair_key
        to_remove = sub_length - params[:diff]

        pair = params[:pair]
        next if to_remove <= 0

        r_start = pair[1] - sub_length + 1
        r_start = 1 if r_start < 1

        r_end = pair[0]
        r_end = subs_count if r_end > subs_count

        (r_start..r_end).each do |index|
          hash[index] = true
        end
      end

      max_sub += subs_count - hash.keys.length
    end

    ans = max_sub if max_sub > ans
  end


  ans
end

