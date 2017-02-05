require_relative "spec_helper"

describe Array do

  context "#all_empty?" do
    it "returns true if all elements of the Array are empty" do
      expect(["", "", ""].all_empty?).to be true
    end

    it "returns false if some of the Array elements are empty" do
      expect(["", :thing, ""].all_empty?).to be false
    end

    it "returns true for an empty Array" do
      expect([].all_empty?).to be true
    end
  end

  context "#all_same?" do
    it "returns true if all elements of the Array are the same" do
      expect(["A", "A", "A"].all_same?).to be true
    end

    it "returns false if some of the Array elements are not the same" do
      expect(["", 1, "", Object.new, :a].all_same?).to be false
    end

    it "returns true for an empty Array" do
      expect([].all_same?).to be true
    end
  end

  context "#any_empty?" do
    it "returns true if one element in the array is empty" do
      expect(["A", "", "B"].any_empty?).to be true
    end

    it "returns false if there are no empty elements in the array" do
      expect(["1", "this", :thing].any_empty?).to be false
    end

    it "returns false if the array has no elements" do
      expect([].any_empty?).to be false
    end
  end

  context "#none_empty?" do
    it "returns false if one element in the array is empty" do
      expect(["A", "", "B"].none_empty?).to be false
    end

    it "returns true if there are no empty elements in the array" do
      expect(["1", "this", :thing].none_empty?).to be true
    end

    it "returns true if the array has no elements" do
      expect([].none_empty?).to be true
    end

  end

end
