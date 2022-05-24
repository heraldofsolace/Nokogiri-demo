require 'nokogiri'
require 'open-uri'

puts "Enter a search term"
search_term = gets.chomp

doc = Nokogiri::HTML5(URI.open("https://www.scrapethissite.com/pages/forms/?q=#{search_term}"))

teams = {}

doc.css("tr.team").each do |team|
  team_name = team.at(".name").content.strip
  team_wins = team.at(".wins").content.to_i

  teams[team_name] ||= 0
  teams[team_name] += team_wins
end

teams.each do |team_name, team_wins|
  puts "#{team_name} => #{team_wins}"
end

