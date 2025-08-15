def is_match(s, p)
  a = 0
  gosu = 0
  asterix_positions = (0...p.length).find_all { |n| p[n] == '*' }.map { |n| n - (a += 1) }
  pattern = p.gsub('*', '')
  char_index = 0
  pattern_index = 0

  # "c"
  # s = "aabcbcbcaccbcaabc"
  # p = ".*a*aa*.*b*.c*.*a*"
  # s = "mississippi"
  # p = "mis*is*ip*."

  p pattern
  p asterix_positions


  next_real_index = lambda do |start_from|
    i = start_from
    while i < pattern.length && asterix_positions.include?(i)
      i += 1
    end

    i
  end
  # next_real char_match?
  #
  left_of_string = -> { (s.length - 1) - char_index }

  while char_index < s.length
    is_asterix = asterix_positions.include?(pattern_index)

    p "char_index:s[char_index]/pattern_index:pattern[pattern_index]/is_asterix = #{char_index}:#{s[char_index]}/#{pattern_index}:#{pattern[pattern_index]}/#{is_asterix}"

    if is_asterix
      if char_match?(s[char_index], pattern[pattern_index])

        p "pattern_index:#{pattern_index}"

        next_real = next_real_index.call(pattern_index)
        p "next_real:#{next_real}/#{pattern[next_real]}"

        # min_left

        while !char_match?(s[char_index], pattern[next_real]) && char_match?(s[char_index], pattern[pattern_index])


          char_index += 1
          p "FEEDchar_index:#{char_index}"
        end
      end

      pattern_index += 1
      next
    end

    p "COMPARE!: #{char_index}:#{s[char_index]}/#{pattern_index}:#{pattern[pattern_index]}"

    return false unless char_match?(s[char_index], pattern[pattern_index])

    pattern_index += 1
    char_index += 1
  end

  # p pattern_index, pattern
  # p left_of_pattern.call

  reals_left = -> { (pattern.length - 1) - pattern_index - asterix_positions.filter { |n| n >= pattern_index }.length }
  p reals_left.call
  # pattern_index - 1 == pattern.length
  reals_left.call < 0
end
