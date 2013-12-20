require 'rubygems'
require 'nokogiri'   
require 'open-uri'



class Upoloipo

	page = Nokogiri::HTML(open("http://services.vodafone.gr/services/myvmb/landing.action?null"))   
	account_balance=page.css('.text_content_18_b').text

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

	puts "SHMERA EXOYME #{today_day}/#{today_month}"
	puts "HMEROMHNIA ANANEWSHS INTERNET #{expiry_day}/#{expiry_month}"

	if expiry_month == today_month

		remaining_days = expiry_day - today_day + 1
		puts "APOMENOYN #{remaining_days} MERES"
	else

		case expiry_month
			when 1, 3, 5, 7, 8, 10, 12
				remaining_days = 31 - today_day + 1 + 13
			when 2
				remaining_days = 28 - today_day + 1 + 13
			else
				remaining_days = 30 - today_day + 1 + 13
			end

		puts "APOMENOYN #{remaining_days} MERES"
	end

	mb_per_day = account_balance.slice(/\d+/).to_i/remaining_days

	puts "YPOLOIPO #{account_balance.slice(/\d+/)} MB"
	puts "KATANALWSH #{mb_per_day} MB ANA HMERA"

end

