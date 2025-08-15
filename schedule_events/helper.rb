
# 2 3
# 2 4
# 1 2




# [[1,7],[2,3],[3,4]]
# 1-          7
# 1-          7
# 1-          7
# 1-          7
#   2-    5
#     3-4


# [[1,7],[2,3],[3,4]]
#     3-4
#   2-    5
# 1-          7
# 1-          7
# 1-          7
# 1-          7

start = Time.now
s += Time.now - start

p s



#  [[1,2],[1,2],[3,3],[1,5],[1,5]]
# 1-2
# 1-3
# 1-      5
# 1-      5
#     3!







sorted.each do |event|
  p days_booked
  # p event

  # event[1] - event[0]
  # event[1]
  # 3




  days.each do |d|
    d
  end


  (event[0]..event[1]).each do |d|
    unless days_booked.include?(d)
      days_booked.push d
      break
    end
  end
end



def max_events(events)
  min_d = events.min[0]
  # sorted = events.sort{|a,b| a[1] <=> b[1]}
  sorted = events.sort

  max_d = events.sort{|a,b| a[1] <=> b[1]}[-1][1]

  days = (min_d..max_d)
  # days_arr = sorted.map {|e| (e[0]..e[1]).to_a}.reduce([]) {|acc, arr| acc += arr; acc}.uniq.sort

  p sorted
  p '-------------'

  days_booked_count = 0
  queue = []

  days.each do |d|
    # p "---------d:#{sorted.length}"
    if sorted.empty?
      break
    end

    # p d
    # p sorted
    # event = sorted[0]
    sorted.each_with_index do |event, index|
      if event[1] < d
        sorted.delete_at(index)
      end

      if event[0] <= d && d <= event[1]
        sorted.delete_at(index)
        # sorted.shift
        days_booked_count += 1
        break
      end
    end

  end

  days_booked_count
end