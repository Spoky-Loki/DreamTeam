require 'open-uri'
require 'nokogiri'
require 'json'

def GetGamesID(data)
  arr = data.match(/<body>(?<information>.*)<\/body>/)[1].split(',')
  res = []
  i = 0
  while i < arr.size
    a1 = arr[i].match(/\{"appid":(?<id>.*)/)
    if (!a1.nil?)
      res.push(a1[:id])
    end
    i += 1
  end
  return res
end

=begin
url2 = 'https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=1440360'
doc2 = Nokogiri::HTML5(URI.open(url2)).to_s
#puts doc2

reg = /<body>(?<information>.*)<\/body>/
match_data = doc2.match(reg)

if match_data.nil?
  puts "No match"
else
  puts(match_data[:information])
end
=end

gamesID = GetGamesID(Nokogiri::HTML5(URI.open('https://api.steampowered.com/ISteamApps/GetAppList/v2/?key=32B040E9C3CFEE31A743F7F0FF906454&steamids=76561198109538094')).to_s)
puts gamesID
