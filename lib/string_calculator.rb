class StringCalculator
    def add(input)
        return 0 if input.empty?
        delimiter = ","
        if input.start_with?("//")
        parts = input.split("\n", 2)
        delimiter = parts[0][2]
        input = parts[1]
        end

        input = input.gsub("\n", delimiter)
        numbers = input.split(delimiter).map(&:to_i)
        numbers.sum
    end
end