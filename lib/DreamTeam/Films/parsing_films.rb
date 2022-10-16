require 'open-uri'
require 'nokogiri'
require 'json'

uri = 'https://imdb-api.com/en/API/Top250Movies/k_uq4za59n'
doc = Nokogiri::HTML(URI.open(uri))
puts doc

# itemes [  {}, {}, {}  ]

#{"items": [ {hash, hash, hash}, {hash, hash, hash}]

# {"id":"tt0111161",
# "rank":"1",
# "title":"The Shawshank Redemption",
# "fullTitle":"The Shawshank Redemption (1994)",
# "year":"1994",
# "image":"https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg",
# "crew":"Frank Darabont (dir.), Tim Robbins, Morgan Freeman","imDbRating":"9.2","imDbRatingCount":"2650504"}


=begin
showings = []
doc.css('.showing').each do |showing|
  showing_id = showing['id'].split('_').last.to_i
  tags = showing.css('.tags a').map { |tag| tag.text.strip }
  title_el = showing.at_css('h1 a')
  title_el.children.each { |c| c.remove if c.name == 'span' }
  title = title_el.text.strip
  dates = showing.at_css('.start_and_pricing').inner_html.strip
  dates = dates.split('<br>').map(&:strip).map { |d| DateTime.parse(d) }
  description = showing.at_css('.copy').text.gsub('[more...]', '').strip
  showings.push(
    id: showing_id,
    title: title,
    tags: tags,
    dates: dates,
    description: description
  )
end

puts JSON.pretty_generate(showings)
=end

