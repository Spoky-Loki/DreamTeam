require 'open-uri'
require 'nokogiri'
require 'json'


def GetGamesID(max = 100)
  key = File.open('lib/DreamTeam/Games/key.txt')
  url = Nokogiri::HTML5(URI.open('https://api.steampowered.com/IStoreService/GetAppList/v1/?key=' +
                                   + key.read + '&include_games=true&max_results=' + max.to_s)).to_s
  arr = url.split(',')
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
  return res
end

def InformationOfGames(gamesID)
  res = []
  gamesID.each do |g|
    begin
      url = Nokogiri::HTML5(URI.open('https://store.steampowered.com/api/appdetails/?appids=' + g)).to_s
    rescue
      next
    end
    name = url[/"name":"(?<name>.*)","steam_/, 1]
    if name == nil
      next
    end
    date = url[/date":"(?<date>.*)"},"su/, 1]
    price = url[/nal_formatted":"(?<price>.*)."},"pac/, 1]
    developers = url[/"developers":\[(?<developers>.*)\],"publishers"/, 1]
    if developers != nil
      developers = developers.delete "\""
    end
    recommendations = url[/tions":{"total":(?<recommendations>\d*)/, 1]
    desc = url[/t_description":"(?<desc>.*)","sup/, 1]
    img = url[/"header_image":"(?<img>.*)","website"/, 1]

    res.push({name: name, date: date, price: price, developers: developers,
              recommendations: recommendations, desc: desc, img: img})
  end
  return res
end

gamesID = GetGamesID(100)
gamesInformation = InformationOfGames(gamesID)
puts gamesInformation
puts gamesInformation.size
