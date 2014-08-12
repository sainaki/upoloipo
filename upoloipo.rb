require 'rubygems'
require 'nokogiri'
require 'open-uri'
require './check'

a=Check.new

page = Nokogiri::HTML(open("http://services.vodafone.gr/services/myvmb/landing.action?null"))
account_balance=page.css('.text_content_18_b').text

today = Time.new
expiry_day = 13
today_day=today.day
today_month=today.month


if today_day.to_i <= 12
	expiry_month = today_month
else
	expiry_month = today_month.to_i + 1
end

puts "ΣΗΜΕΡΑ ΕΧΟΥΜΕ #{today_day}/#{today_month}"
puts "ΗΜΕΡΟΜΗΝΙΑ ΑΝΑΝΕΩΣΗΣ ΙΝΤΕΡΝΕΤ #{expiry_day}/#{expiry_month}"


remaining_days = a.check_month(expiry_day,today_day,expiry_month,today_month)

mb_per_day = account_balance.slice(/\d+/).to_i/remaining_days.to_i

puts "ΥΠΟΛΟΙΠΟ #{account_balance.slice(/\d+/)} MB"
puts "ΚΑΤΑΝΑΛΩΣΗ #{mb_per_day} MB ΑΝΑ ΗΜΕΡΑ"
