require 'rubygems'
require 'nokogiri'   
require 'open-uri'

class Upoloipo

today = Time.new
expiry_day = 13
expiry_month = expiry_month.to_i
today_day=today.day.to_i
today_month=today.month.to_i
if today_month < 12
	expiry_month = today_month + 1
else
	expiry_month = 1	
end 

puts "Σήμερα #{today_day}/#{today_month}"
puts "Ημερομηνία λήξης #{expiry_day}/#{expiry_month}"

account_balance = 8000

if expiry_month == today_month

	remaining_days = expiry_day - today_day + 1
	puts "Απομένουν #{remaining_days} μέρες"
else

	case expiry_month
		when 1, 3, 5, 7, 8, 10, 12
			remaining_days = 31 - today_day + 1 + 13
		when 2
			remaining_days = 28 - today_day + 1 + 13
		else
			remaining_days = 30 - today_day + 1 + 13
		end

	puts "Απομένουν #{remaining_days} μέρες"
end




page = Nokogiri::HTML(open("http://www.meteo.gr/meteoplus/cf.cfm?city_id=1"))   
puts page.class  

timi=page.css('.station-temp').text

puts timi.slice(/\d+/)



end
