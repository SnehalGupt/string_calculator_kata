class StringCalculator
  def add(input)
    return 0 if input.empty?

    numbers_part = input
    delimiter_regex = ","

    if input.start_with?("//")
      delimiter_section, numbers_part = input.split("\n", 2)

      if delimiter_section.include?("[")
        # multiple delimiters case
        delimiters = delimiter_section.scan(/\[(.+?)\]/).flatten
        delimiter_regex = delimiters.map { |d| Regexp.escape(d) }.join('|')
      else
        # single char delimiter
        delimiter_regex = Regexp.escape(delimiter_section[2])
      end
    end

    # split by delimiter(s) or newline
    numbers = numbers_part.split(/#{delimiter_regex}|\n/).map(&:to_i)

    numbers.sum
  end
end