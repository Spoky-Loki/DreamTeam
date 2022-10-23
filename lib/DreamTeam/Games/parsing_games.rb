require 'open-uri'
require 'nokogiri'
require_relative 'api_key'

def get_user_information(steam_id)
  url = Nokogiri::HTML5(URI.open('https://steamcommunity.com/profiles/' + steam_id + '/?xml=1')).to_s
  username = url[/<steamid><!--\[CDATA\[(?<username>.*)\]\]--><\/steamid>/, 1]
  avatar = url[/<avataricon><!--\[CDATA\[(?<avatar>.*)\]\]--><\/avataricon>/, 1]
  {username: username, avatar: avatar}
end

def get_user_games(steam_id)
  res = []
  begin
    url = Nokogiri::HTML5(URI.open('https://api.steampowered.com/IPlayerService/GetOwnedGames/v1/?steamid=' +
      + steam_id + '&key=' + GetKey())).to_s
  rescue
    return res
  end
  arr = url.split(',')
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
    time = g[:time]
    date = url[/date":"(?<date>.*)"},"su/, 1]
    price = url[/nal_formatted":"(?<price>.*) pуб\."},"pac/, 1]
    if price == nil
      price = url[/nal_formatted":"(?<price>.*)"},"pac/, 1]
    else
      price += ' rub'
    end
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

#rogalik = '76561198109538094'
#spoky_loki = '76561198271666506'
#
#user_information = get_user_information(rogalik)
#puts user_information
gamesInformation = information_of_games(get_user_games(spoky_loki))
puts gamesInformation
puts gamesInformation.size
