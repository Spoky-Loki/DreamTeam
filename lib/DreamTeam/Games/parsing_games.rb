require 'open-uri'
require 'nokogiri'
require_relative 'api_key'

def get_user_games(steam_id)
  url = Nokogiri::HTML5(URI.open('https://api.steampowered.com/IPlayerService/GetOwnedGames/v1/?steamid=' +
    + steam_id + '&key=' + GetKey())).to_s
  arr = url.split(',')
  res = []
  last_id = ''
  arr.each do |a|
    id = a.match(/"appid":(?<id>.*)/)
    if !id.nil?
      last_id = id[:id]
    else
      time = a.match(/"playtime_forever":(?<time>.*)/)
      if !time.nil?
        res.push({id: last_id, time: time[:time]})
      end
    end
  end
  res
end

def information_of_games(games_id)
  res = []
  games_id.each do |g|
    begin
      url = Nokogiri::HTML5(URI.open('https://store.steampowered.com/api/appdetails/?appids=' + g[:id])).to_s
    rescue
      next
    end
    name = url[/"name":"(?<name>.*)","steam_/, 1]
    if name == nil
      next
    end
    time = g[:time]
    date = url[/date":"(?<date>.*)"},"su/, 1]
    price = url[/nal_formatted":"(?<price>.*)."},"pac/, 1]
    developers = url[/"developers":\[(?<developers>.*)\],"publishers"/, 1]
    if developers != nil
      developers = developers.delete "\""
    end
    recommendations = url[/tions":{"total":(?<recommendations>\d*)/, 1]
    desc = url[/t_description":"(?<desc>.*)","sup/, 1]
    img = url[/"header_image":"(?<img>.*)","website"/, 1]

    res.push({name: name, time: time, date: date, price: price, developers: developers,
              recommendations: recommendations, desc: desc, img: img})
  end
  res
end

#gamesInformation = InformationOfGames(GetUserGames('76561198109538094'))
#puts gamesInformation
#puts gamesInformation.size
