require 'open-uri'
require 'nokogiri'
require 'json'

def GetGamesID(min = 0, max = 0)
  url = Nokogiri::HTML5(URI.open('https://api.steampowered.com/ISteamApps/GetAppList/v2/?key=32B040E9C3CFEE31A743F7F0FF906454&steamids=76561198109538094')).to_s
  arr = url.match(/<body>(?<information>.*)<\/body>/)[1].split(',')
  res = []
  i = 0
  while i < arr.size
    id = arr[i].match(/\{"appid":(?<id>.*)/)
    if !id.nil?
      res.push(id[:id])
    end
    if max != -1 and res.size == max
      break
    end
    i += 1
  end
  max = res.size
  return res[min, max]
end

def InformationOfGames(gamesID)
  res = []
  gamesID.each do |g|
    begin
      information = Nokogiri::HTML5(URI.open('https://store.steampowered.com/api/appdetails/?appids=' + g)).to_s
      if information.include?('"type":"game"')
        #puts information
        matchInformation = information.match(/"name":"(?<title>.*)","steam_appid".*"short_description":"(?<shortDesc>.*)","supported_languages":"/)
        if !matchInformation[:title].nil? and !matchInformation[:shortDesc].nil?
          puts matchInformation[:title] + matchInformation[:shortDesc]
        end
      end
    rescue
      next
    end
  end
  return res
end

gamesID = GetGamesID(100, 200)
gamesInformation = InformationOfGames(gamesID)
