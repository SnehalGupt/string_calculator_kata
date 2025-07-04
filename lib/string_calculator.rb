class StringCalculator
    def add(input)
        return 0 if input.empty?
        input = input.gsub("\n", ",")
        
        numbers = input.split(",").map(&:to_i)
        numbers.sum
    end
end 