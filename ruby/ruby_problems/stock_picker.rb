def stock_picker(stocks)
	highest_profit = 0
	day_to_buy = 0
	day_to_sell = 0
	days_to_trade = []

	stocks.each_with_index do |price, index|
		i = index

		while i < stocks.length-1
			if stocks[i+1] - price > highest_profit
				day_to_buy = index
				day_to_sell = i+1
				highest_profit = stocks[i+1] - price
			end	
			i += 1
		end

	end

	days_to_trade.push(day_to_buy,day_to_sell)
	p days_to_trade
	puts "For a profit of #{highest_profit}"


end


stock_picker([89,6,4,444,1])