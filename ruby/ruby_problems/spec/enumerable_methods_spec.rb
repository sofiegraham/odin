require "enumerable_methods"

describe Enumerable do

	let(:array) {[1,2,3,4,5]}
	let(:new_array) {[]}
	let(:nil_array) {[1,2,3,nil,4,5]}
	let(:false_array) {[nil,nil,false]}

	describe "#my_each" do

		context "given no block" do
			it "returns the array" do
				expect(array.my_each).to eql([1,2,3,4,5])
			end
		end

		context "given a block" do
			it "iterates through the array and performs the block on each item" do
				expect(array.my_each {|x| new_array << x}).to eql([1,2,3,4,5])
				expect(new_array).to eql([1,2,3,4,5])
			end
		end
	end

	describe "#my_all?" do

		context "with a block" do
			it "returns true if all elements are true" do
				expect(array.my_all? {|x| x.instance_of? Fixnum}).to eql(true)
			end
			it "returns false if at least one element is false" do
				expect(nil_array.my_all? {|x| x.instance_of? Fixnum}).to eql(false)
			end
		end
	end

	describe "#my_map" do

		context "with a block" do
			it "iterates over array, performs block on each, and returns edited array" do
				expect(array.my_map {|x| x + 1}).to eql([2,3,4,5,6])
			end
		end
	end
	
end