require_relative '../lib/string_calculator'
RSpec.describe StringCalculator do 
    let(:calculator) { StringCalculator.new }
    describe "#add" do
        it "returns 0 for an empty string" do 
            # calc = StringCalculator.new
            expect(calculator.add(" ")).to eq(0)
        end
        it 'returns the sum of two numbers separated by comma' do
            # calc = StringCalculator.new
            expect(calculator.add("1,2")).to eq(3)
        end 

        it 'returns the sum of multiple numbers separated by commas' do
            expect(calculator.add("1,2,3,4")).to eq(10)
        end

        it 'returns the sum of an unknown amount of numbers' do
            expect(calculator.add("2,4,6,8,10")).to eq(30)
        end

        it 'returns the sum when numbers are separated by newlines as well as commas' do
            expect(calculator.add("1\n2,3")).to eq(6)
        end
    end 
end 