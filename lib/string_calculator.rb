class StringCalculator
  def initialize
    @call_count = 0
  end

  def add(input)
    @call_count += 1
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

    # numbers = numbers_part.split(/#{delimiter_regex}|\n/).map(&:to_i)
    numbers = numbers_part
            .split(/#{delimiter_regex}|\n/)
            .map(&:to_i)
            .select { |n| n <= 1000 }
    negatives = numbers.select { |n| n < 0 }
    unless negatives.empty?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end

    numbers.sum
  end

  def get_called_count
    @call_count
  end
end
