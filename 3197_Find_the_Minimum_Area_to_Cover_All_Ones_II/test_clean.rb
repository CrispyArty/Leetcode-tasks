@dp = {}

def find_area(x, x1, y, y1, grid)
  hor_min_max = [x1, 0]
  ver_min_max = [y1, 0]

  key = "#{x},#{x1},#{y},#{y1}"

  return @dp[key] unless @dp[key].nil?

  (y...y1).each do |i|
    (x...x1).each do |j|
      val = grid[i][j]
      next if val.zero?

      ver_min_max[0] = i if ver_min_max[0] > i
      ver_min_max[1] = i if ver_min_max[1] < i

      hor_min_max[0] = j if hor_min_max[0] > j
      hor_min_max[1] = j if hor_min_max[1] < j
    end
  end

  hor_line = hor_min_max[1] - hor_min_max[0] + 1
  ver_line = ver_min_max[1] - ver_min_max[0] + 1

  @dp[key] = hor_line > 0 ? hor_line * ver_line : (1 << 31)
end

def min_for_half(grid)
  hor_length = grid[0].length
  ver_length = grid.length

  min_area = hor_length * ver_length

  (1...ver_length).each do |ver|
    (1...hor_length).each do |hor|
      top_left = find_area(0, hor, 0, ver, grid)
      top_right = find_area(hor, hor_length, 0, ver, grid)
      bottom_left = find_area(0, hor, ver, ver_length, grid)
      bottom_right = find_area(hor, hor_length, ver, ver_length, grid)

      min_area = [
        min_area,
        top_left + bottom_left + find_area(hor, hor_length, 0, ver_length, grid),
        top_right + bottom_right + find_area(0, hor, 0, ver_length, grid),
        top_left + top_right + find_area(0, hor_length, ver, ver_length, grid),
        bottom_left + bottom_right + find_area(0, hor_length, 0, ver, grid),
      ].min

    end
  end


  (1...(hor_length - 1)).each do |i|
    ((i + 1)...hor_length).each do |j|
      min_area = [
        min_area,
        find_area(0, i, 0, ver_length, grid) +
          find_area(i, j, 0, ver_length, grid) +
          find_area(j, hor_length, 0, ver_length, grid)
      ].min
    end
  end

  (1...(ver_length - 1)).each do |i|
    ((i + 1)...ver_length).each do |j|
      min_area = [
        min_area,
        find_area(0, hor_length, 0, i, grid) +
          find_area(0, hor_length, i, j, grid) +
          find_area(0, hor_length, j, ver_length, grid)
      ].min
    end
  end

  min_area
end

# def rotate90(grid)
#   hor_length = grid[0].length
#   ver_length = grid.length

#   rot = Array.new(hor_length) { Array.new(ver_length, 0) }

#   (0...ver_length).each do |i|
#     (0...hor_length).each do |j|
#       rot[j][ver_length - i - 1] = grid[i][j]
#     end
#   end

#   rot
# end

def minimum_sum(grid)
  @dp = {}

  #   rgrid = rotate90(grid)
  min_for_half(grid)
  #   [min_for_half(grid), min_for_half(rgrid)].min
end
