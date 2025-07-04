require_relative '../lib/string_calculator'
RSpec.describe StringCalculator do 
    describe "#add" do
        it "returns 0 for an empty string" do 
            calc = StringCalculator.new
            expect(calc.add(" ")).to eq(0)
        it 'returns the sum of two numbers separated by comma' do
            expect(calculator.add("1,2")).to eq(3)
        end
        end 
    end 
end 