require 'open-uri'
require 'nokogiri'
require 'json'

def GetGamesID(max = 100)
  url = Nokogiri::HTML5(URI.open('https://api.steampowered.com/IStoreService/GetAppList/v1/?key=FB8E10E3C18DFD06F605ACF4D049866A&include_games=true&max_results=' + max.to_s)).to_s
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
  return res
end

def InformationOfGames(gamesID)
  res = []
  gamesID.each do |g|
    begin
      information = Nokogiri::HTML5(URI.open('https://store.steampowered.com/api/appdetails/?appids=' + g)).to_s
      allReviews = Nokogiri::HTML5(URI.open('https://store.steampowered.com/appreviews/' + g + '?json=1&language=all')).to_s
      if information.include?('"type":"game"')
        #puts allReviews.split(',')
        informations = information.match(/me":"(?<name>.*)","steam.*t_description":"(?<desc>.*)","sup.*nal_formatted":"(?<price>.*)."},"pac.*date":"(?<data>.*)"},"su/)
        imagesDevelopers = information.match(/"header_image":"(?<img>.*)","website".*"developers":\[(?<developers>.*)\],"publishers":\[(?<publishers>.*)\],"(price_|demos)/)

        matchReviews = allReviews.match(/"total_positive":(?<positiveReviews>.*),"t.*"total_reviews":(?<reviews>.*)},"reviews":\[/)

        if !informations[:name].nil?
          name = informations[:name]
          price = informations[:price]
          data = informations[:data]
          desc = informations[:desc]
          img = imagesDevelopers[:img]
          developers = imagesDevelopers[:developers]
          developers = developers.delete "\""
          publishers = imagesDevelopers[:publishers]
          publishers = publishers.delete "\""
          reviews = matchReviews[:reviews]
          positiveReviews = matchReviews[:positiveReviews]
          res.push({name: name, price: price, data: data, desc: desc,
                    img: img, developers: developers, publishers: publishers,
                    reviews: reviews, positiveReviews: positiveReviews})
        end
      end
    rescue
      next
    end
  end
  return res
end

gamesID = GetGamesID(100)
gamesInformation = InformationOfGames(gamesID)
puts gamesInformation
