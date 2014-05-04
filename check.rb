
class Check
	def check_month(expiry_day,today_day,expiry_month,today_month)
		if expiry_month.to_i == today_month.to_i
			remaining_days = expiry_day.to_i - today_day.to_i + 1
			puts "ΑΠΟΜΕΝΟΥΝ #{remaining_days} ΜΕΡΕΣ"
		else
			case expiry_month.to_i
				when 1, 3, 5, 7, 8, 10, 12
					remaining_days = 31 - today_day.to_i + 1 + 13
				when 2
					remaining_days = 28 - today_day.to_i + 1 + 13
				else
					remaining_days = 30 - today_day.to_i + 1 + 13
			end
			puts "ΑΠΟΜΕΝΟΥΝ #{remaining_days} ΜΕΡΕΣ"
		end
		return remaining_days
	end
end
