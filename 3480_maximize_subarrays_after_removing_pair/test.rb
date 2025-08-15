def max_subarrays1(n, conflicting_pairs)
  b_min1 = [11111] * (n + 1)
  b_min2 = [11111] * (n + 1)
  p conflicting_pairs
  conflicting_pairs.each do |pair|
    a = [pair[0], pair[1]].min
    b = [pair[0], pair[1]].max

    if b_min1[a] > b
      b_min2[a] = b_min1[a]
      b_min1[a] = b
    elsif b_min2[a] > b
      b_min2[a] = b
    end
  end

  p b_min1
  p b_min2
end

# @param {Integer} n
# @param {Integer[][]} conflicting_pairs
# @return {Integer}
def max_subarrays(n, conflicting_pairs)
  # bMin1 = [2**31 - 1] * (n + 1)
  # bMin2 = [2**31 - 1] * (n + 1)
  # for pair in conflictingPairs:
  #   a = min(pair[0], pair[1])
  #   b = max(pair[0], pair[1])
  #   if bMin1[a] > b:
  #     bMin2[a] = bMin1[a]
  #   bMin1[a] = b
  #   elif bMin2[a] > b:
  #     bMin2[a] = b

  pair_map = {}

  grouped_by_right = Array.new(n + 1) {[]}

  conflicting_pairs.each do |p|
    grouped_by_right[p.max].push(p.min)
  end

  p "grouped_by_right: #{grouped_by_right}"

  # conflicting_pairs.each do |p|
  #   pair = p[1] > p[0] ? p : p.reverse
  #   diff = (pair[1] - pair[0]).abs
  #
  #   pair_map[p] = {
  #     pair: pair,
  #     diff: diff,
  #   }
  # end

  # pair_map.delete([5,9])

  # p "pair_map: #{pair_map}"
  # return

  res = 0
  bonus = Array.new(n + 1, 0)
  tops = [0, 0]

  (1..n).each do |num|
    grouped_by_right[num].each do |left|
      if left > tops[0]
        tops = [left, tops[0]]
      elsif left > tops[1]
        tops = [tops[0], left]
      end
    end

    p "res: #{res}"
    # p "top1:#{top1} top2: #{top2}"
    p "tops: #{tops}"
    bonus[tops[0]] += tops[0] - tops[1] if tops[0] > 0
    res += num - tops[0]
  end


  p "res: #{res}"
  p "res: #{res + bonus.max}"


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

        # p "params: #{params} pair: #{pair}"

        r_start = pair[1] - sub_length + 1
        r_start = 1 if r_start < 1

        r_end = pair[0]
        r_end = subs_count if r_end > subs_count

        (r_start..r_end).each do |index|
          hash[index] = true
        end
      end

      # p "hash: #{hash}"
      max_sub += subs_count - hash.keys.length
    end

    # p "max_sub: #{max_sub}"
    ans = max_sub if max_sub > ans
  end

  ans
end

n = 20
conflicting_pairs = [[5, 9], [10, 18], [10, 14]]
p max_subarrays(n, conflicting_pairs)

# n = 20
# conflicting_pairs = [[5,9],[5,9],[10,14]]
# p max_subarrays(n, conflicting_pairs)

# n = 20
# conflicting_pairs = [[12,7],[9,11]]
# p max_subarrays(n, conflicting_pairs)

#
# n = 25
# conflicting_pairs = [[25,18],[2,13],[15,12],[12,15]]
# p max_subarrays(n, conflicting_pairs)

# n = 926
# conflicting_pairs = [[381, 790], [233, 15], [42, 903], [7, 764], [890, 269], [84, 262], [870, 514], [514, 650], [269, 485], [760, 907], [181, 489], [107, 585], [428, 862], [563, 249], [888, 564], [580, 882], [871, 578], [471, 332], [79, 517], [374, 292], [71, 607], [412, 329], [64, 723], [288, 5], [848, 745], [668, 340], [515, 825], [348, 194], [162, 60], [307, 887], [103, 23], [711, 1], [723, 461], [67, 744], [254, 831], [431, 274], [51, 594], [380, 499], [550, 586], [312, 493], [413, 351], [652, 274], [66, 352], [517, 899], [749, 193], [642, 736], [695, 681], [504, 393], [323, 559], [496, 200], [104, 852], [394, 660], [856, 286], [535, 333], [689, 418], [871, 681], [275, 583], [813, 151], [811, 88], [390, 858], [480, 919], [824, 771], [820, 142], [198, 899], [762, 629], [517, 626], [383, 426], [79, 646], [591, 311], [760, 201], [344, 74], [835, 75], [433, 604], [306, 484], [297, 556], [605, 234], [610, 94], [467, 324], [63, 149], [18, 133], [174, 865], [175, 396], [198, 424], [67, 694], [442, 264], [532, 434], [767, 2], [498, 35], [626, 774], [31, 189], [427, 480], [650, 351], [920, 266], [28, 2], [594, 779], [33, 832], [706, 265], [698, 29], [390, 328], [621, 273], [550, 752], [302, 116], [515, 871], [22, 886], [661, 575], [181, 910], [593, 279], [893, 45], [693, 596], [183, 640], [140, 370], [59, 30], [429, 626], [842, 162], [287, 913], [887, 551], [435, 108], [609, 40], [736, 147], [336, 122], [3, 278], [875, 315], [217, 326], [675, 742], [451, 479], [570, 316], [135, 349], [127, 569], [660, 849], [863, 552], [237, 173], [689, 530], [686, 913], [438, 300], [644, 4], [454, 48], [827, 352]]
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





