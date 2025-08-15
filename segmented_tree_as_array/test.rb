class SegTree
  attr_accessor :seg_array, :baskets, :n

  def initialize(baskets = [])
    @baskets = baskets
    @n = baskets.length
    # max_nodes = 1 << Math.log(n, 2).ceil
    @seg_array = Array.new(4 * n, 0)

    build(0, 0, n - 1)
  end

  def find_and_remove_basket(fruits)
    query_tree(0, 0, n - 1, fruits)
  end

  def update(index, value)
    update_tree(0, 0, n - 1, index, value)
  end

  protected

  def build(pos, start_range, end_range)
    if start_range == end_range
      seg_array[pos] = baskets[start_range]
      return
    end

    mid = (start_range + end_range) >> 1

    left_node = (pos << 1) + 1
    right_node = left_node + 1

    build(left_node, start_range, mid)
    build(right_node, mid + 1, end_range)

    seg_array[pos] = [seg_array[left_node], seg_array[right_node]].max
  end

  def query_tree(pos, left, right, fruits)
    return nil if seg_array[pos] < fruits

    if left == right
      seg_array[pos] = 0

      return left
    end
    return left if left == right

    mid = (left + right) >> 1

    left_node = (pos << 1) + 1
    right_node = left_node + 1

    left_branch = query_tree(left_node, left, mid, fruits)

    res = left_branch || query_tree(right_node, mid + 1, right, fruits)

    seg_array[pos] = [seg_array[left_node], seg_array[right_node]].max unless res.nil?

    res
  end
end


def num_of_unplaced_fruits(fruits, baskets)
  tree = SegTree.new(baskets)
  unplaced = 0

  fruits.each do |fruit|

    start1 = Time.now

    basket_index = tree.find_and_remove_basket(fruit)

    unplaced += 1 if basket_index.nil?

    query_time += Time.now - start1
  end

  unplaced
end

# fruits = [35, 61]
# baskets = [76, 56]
# p num_of_unplaced_fruits(fruits, baskets)

# [5, 4, 2]

# [4, 2, 4]
# [5, 4, 3]

# fruits = [4, 2, 4]
# baskets = [3, 5, 4]
# p num_of_unplaced_fruits(fruits, baskets)
#
# fruits = [4, 2, 4]
# baskets = [5, 4, 3]
# p num_of_unplaced_fruits(fruits, baskets)
#
# fruits = [4, 2, 5]
# baskets = [3, 5, 4]
# p num_of_unplaced_fruits(fruits, baskets)
#
# fruits = [5, 4, 2]
# baskets = [5, 4, 3]
# p num_of_unplaced_fruits(fruits, baskets)
#
# fruits = [3, 6, 1]
# baskets = [6, 4, 7]
# p num_of_unplaced_fruits(fruits, baskets)

# fruits = [5, 4, 3, 2, 1]
# baskets = [1, 2, 3, 4, 5]
# p num_of_unplaced_fruits(fruits, baskets)

# fruits = [10, 9, 8, 7, 6, 5]
# baskets = [1, 2, 3, 4, 5, 6]
# p num_of_unplaced_fruits(fruits, baskets)
#
#
# fruits = [10, 9, 8, 7, 6, 5]
# baskets = [1, 2, 3, 4, 5, 6, 7]
# p num_of_unplaced_fruits(fruits, baskets)
#
#
#
# fruits = [10, 9, 8, 7, 6, 5]
# baskets = [1, 2, 3, 4, 5, 6, 7, 8]
# p num_of_unplaced_fruits(fruits, baskets)
#
#
# fruits = [10, 9, 8, 7, 6, 5]
# baskets = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# p num_of_unplaced_fruits(fruits, baskets)
#
# fruits = [10, 9, 8, 7, 6, 5]
# baskets = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# p num_of_unplaced_fruits(fruits, baskets)
