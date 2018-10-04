# original code
require 'rails_helper'

Sandwich = Struct.new(:taste, :toppings)

RSpec.describe 'An ideal sandwich' do
	it 'is delicious' do
		sandwich = Sandwich.new('delicious', [])

		taste = sandwich.taste
		expect(taste).to eq('delicious')
	end

	it 'lets me add toppings' do
		sandwich = Sandwich.new('delicious', [])
		sandwich.toppings << 'cheese'
		toppings = sandwich.toppings
	end
end

# using before hook to instantiate sandwich
RSpec.describe 'An ideal sandwich' do
	before { @sandwich = Sandwich.new('delicious', []) }
	it 'is delicious' do
		taste = @sandwich.taste
		expect(taste).to eq('delicious')
	end

	it 'lets me add toppings' do
		@sandwich.toppings << 'cheese'
		toppings = @sandwich.toppings
	end
end

# using helper methods to instantiate sandwich
def sandwich
	Sandwich.new('delicious', [])
end

RSpec.describe 'An ideal sandwich' do
	it 'is delicious' do
		taste = sandwich.taste
		expect(taste).to eq('delicious')
	end

	it 'lets me add toppings' do
		sandwich.toppings << 'cheese'
		toppings = sandwich.toppings
	end
end

# using memoization instantiates and stores sandwich
def sandwich
	@sandwich ||= Sandwich.new('delicious', [])
end

RSpec.describe 'An ideal sandwich' do
	it 'is delicious' do
		taste = sandwich.taste
		expect(taste).to eq('delicious')
	end

	it 'lets me add toppings' do
		sandwich.toppings << 'cheese'
		toppings = sandwich.toppings
	end
end

# sharing objects with let binds a name to a computation
RSpec.describe 'An ideal sandwich' do
	let(:sandwich) { Sandwich.new('delicious', []) }
	it 'is delicious' do
		taste = sandwich.taste
		expect(taste).to eq('delicious')
	end

	it 'lets me add toppings' do
		sandwich.toppings << 'cheese'
		toppings = sandwich.toppings
	end
end