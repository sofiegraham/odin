require "ceasar_cipher"

describe "ceasar_cipher" do

	context "lower case" do
		context "single letter" do
			context "shift by 1" do
				context "given 'n'" do
					it "returns 'o'" do
						expect(ceasar_cipher("n",1)).to eql("o")
					end
				end
				context "given z" do
					it "returns a" do
						expect(ceasar_cipher("z",1)).to eql("a")
					end
				end
			end
			context "shift by 10" do
				context "given 'a'" do
					it "returns 'k'" do
						expect(ceasar_cipher("a",10)).to eql("k")
					end
				end
			end
			context "shift by 30" do
				context "given 'a'" do
					it "returns 'e'" do
						expect(ceasar_cipher("a",30)).to eql("e")
					end
				end
			end
		end
	end
	context "upper case" do
		context "single letter" do
			context "shift by 1" do
				context "given 'N'" do
					it "returns 'O'" do
						expect(ceasar_cipher("N",1)).to eql("O")
					end
				end
				context "given Z" do
					it "returns A" do
						expect(ceasar_cipher("Z",1)).to eql("A")
					end
				end
			end
			context "shift by 10" do
				context "given 'A'" do
					it "returns 'K'" do
						expect(ceasar_cipher("A",10)).to eql("K")
					end
				end
			end
			context "shift by 30" do
				context "given 'A'" do
					it "returns 'E'" do
						expect(ceasar_cipher("A",30)).to eql("E")
					end
				end
			end
		end
		context "multiple letter" do
			context "shift by 1" do
				context "given 'NK'" do
					it "returns 'OL'" do
						expect(ceasar_cipher("NK",1)).to eql("OL")
					end
				end
				context "given ZA" do
					it "returns AB" do
						expect(ceasar_cipher("ZA",1)).to eql("AB")
					end
				end
			end
			context "shift by 10" do
				context "given 'AED'" do
					it "returns 'KON'" do
						expect(ceasar_cipher("AED",10)).to eql("KON")
					end
				end
			end
			context "shift by 30" do
				context "given 'AX'" do
					it "returns 'EB'" do
						expect(ceasar_cipher("AX",30)).to eql("EB")
					end
				end
			end
		end
	end

end