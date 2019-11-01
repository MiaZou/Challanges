require 'spec_helper'
require 'fibonacci'
RSpec.describe Fibonacci, type: :model do
  describe "fib should work" do
    it 'should return result if number is given' do
      expect(Fibonacci.recursive_fib(0)).to be 0
    end

    it 'should return result if number is given' do
      expect(Fibonacci.recursive_fib(1)).to be 1
    end

    it 'should return result if number is given' do
      expect(Fibonacci.recursive_fib(5)).to be 5
    end

    it 'should return result if number is given' do
      expect(Fibonacci.recursive_fib(9)).to be 34
    end

    it 'should return result if number is given' do
      expect(Fibonacci.iterative_fib(5)).to be 5
    end

    it 'should return result if number is given' do
      expect(Fibonacci.iterative_fib(9)).to be 34
    end
    
    specify { expect { Fibonacci.bench }.to output.to_stdout }
    Fibonacci.bench
  end
end