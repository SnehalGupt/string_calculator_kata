class StringCalculator
  def add(input)
    return 0 if input.empty?

    numbers_part = input
    delimiter_regex = ","

    if input.start_with?("//")
      delimiter_section, numbers_part = input.split("\n", 2)

      if delimiter_section.include?("[")
        delimiters = delimiter_section.scan(/\[(.+?)\]/).flatten
        delimiter_regex = delimiters.map { |d| Regexp.escape(d) }.join('|')
      else
        delimiter_regex = Regexp.escape(delimiter_section[2])
      end
    end

    numbers = numbers_part.split(/#{delimiter_regex}|\n/).map(&:to_i)

    negatives = numbers.select { |n| n < 0 }
    unless negatives.empty?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end

    numbers.sum
  end
end
