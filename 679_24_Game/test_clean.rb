# 679. 24 Game
# https://leetcode.com/problems/24-game/description/?envType=daily-question&envId=2025-08-18

@operations = [
  ->(a, b) { a + b },
  ->(a, b) { a - b },
  ->(a, b) { a * b },
  ->(a, b) { b - a },
  ->(a, b) { b.zero? ? nil : a / b },
  ->(a, b) { a.zero? ? nil : b / a }
]

def rec_combine(nums)
  return nums[0].round(8) == 24 if nums.length == 1

  (0...nums.length).each do |a_index|
    a = nums[a_index]

    ((a_index + 1)...nums.length).each do |b_index|
      b = nums[b_index]

      new_nums = nums.dup
      new_nums.delete_at(b_index)
      new_nums.delete_at(a_index)

      @operations.each do |op|
        num = op.call(a, b)
        next if num.nil?

        found = rec_combine(new_nums.push(num))

        new_nums.pop

        return true if found
      end
    end
  end

  false
end

# @param {Integer[]} cards
# @return {Boolean}
def judge_point24(cards)
  rec_combine(cards.map(&:to_f))
end

