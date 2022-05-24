require 'nokogiri'
require 'open-uri'

puts "Enter a search term"
search_term = gets.chomp

doc = Nokogiri::HTML5(URI.open("https://www.scrapethissite.com/pages/forms/?q=#{search_term}"))

doc.css("tr.team").each do |team|
  puts team.at(".name").content.strip
end

