require 'open-uri'
require 'nokogiri'
require 'json'


uri = 'https://imdb-api.com/en/API/Top250Movies/k_uq4za59n'
doc = Nokogiri::HTML(URI.open(uri))

text = doc.text.gsub('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
                      "http://www.w3.org/TR/REC-html40/loose.dtd"> <html><body><p>', '')
text = text.gsub('{"items":[', '').gsub(']','')



#text = '{"id":"1424411", ":rank":"1", ":title":"title 1", ":year":"1990", ":image":"http:\picture1.com",":crew":"Tom Jon Mike", ":imDbRating":"9.2", ":imDbRatingCount":"8.1"},{"id":"9352791", ":rank":"2", ":title":"title 2", ":year":"2006", ":image":"http:\picture1.com",":crew":"Tom Jon Mike", ":imDbRating":"9.2", ":imDbRatingCount":"8.1"},{"id":"1908543", ":rank":"3", ":title":"title 3", ":year":"2012", ":image":"http:\picture1.com",":crew":"Tom Jon Mike", ":imDbRating":"9.2", ":imDbRatingCount":"8.1"}'
#text = '{"id":"tt0111161","rank":"1","title":"The Shawshank Redemption","fullTitle":"The Shawshank Redemption (1994)","year":"1994","image":"https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg","crew":"Frank Darabont (dir.), Tim Robbins, Morgan Freeman","imDbRating":"9.2","imDbRatingCount":"2650504"},{"id":"tt0068646","rank":"2","title":"The Godfather","fullTitle":"The Godfather (1972)","year":"1972","image":"https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX128_CR0,12,128,176_AL_.jpg","crew":"Francis Ford Coppola (dir.), Marlon Brando, Al Pacino","imDbRating":"9.2","imDbRatingCount":"1837317"},{"id":"tt0468569","rank":"3","title":"The Dark Knight","fullTitle":"The Dark Knight (2008)","year":"2008","image":"https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_UX128_CR0,12,128,176_AL_.jpg","crew":"Christopher Nolan (dir.), Christian Bale, Heath Ledger","imDbRating":"9.0","imDbRatingCount":"2622617"},{"id":"tt0071562","rank":"4","title":"The Godfather Part II","fullTitle":"The Godfather Part II (1974)","year":"1974","image":"https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX128_CR0,12,128,176_AL_.jpg","crew":"Francis Ford Coppola (dir.), Al Pacino, Robert De Niro","imDbRating":"9.0","imDbRatingCount":"1259016"},{"id":"tt0050083","rank":"5","title":"12 Angry Men","fullTitle":"12 Angry Men (1957)","year":"1957","image":"https://m.media-amazon.com/images/M/MV5BMWU4N2FjNzYtNTVkNC00NzQ0LTg0MjAtYTJlMjFhNGUxZDFmXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_UX128_CR0,12,128,176_AL_.jpg","crew":"Sidney Lumet (dir.), Henry Fonda, Lee J. Cobb","imDbRating":"9.0","imDbRatingCount":"782597"}'
text = text.gsub('},','}')

#puts text

arr_films = []
while text.index('}') != nil
  ind_start = 0 #text.index('{')
  ind_finish = text.index('}')
  dist = ind_finish - ind_start + 1
  arr_films << text[ind_start, dist].gsub(' "','"')
  text = text.gsub(text[ind_start, dist], '')
end
#puts arr_films


arr_film = arr_films[0]
arr = arr_film.to_s.gsub('{','').gsub('}','').gsub('",','"^^^').split('^^^')
#puts arr[0]


class Film
  @@array = Array.new
  attr_reader :id, :rank, :title, :year, :image, :crew, :imDbRating, :imDbRatingCount

  def initialize (arr_film)
    arr = arr_film.to_s.gsub('{','').gsub('}','').gsub('",','"^^^').split('^^^')
    @id = help(arr, 0)
    @rank = help(arr, 1)
    @title = help(arr, 2)
    @year = help(arr, 3)
    @image = help(arr, 4)
    @crew = help(arr, 5)
    @imDbRating = help(arr, 6)
    @imDbRatingCount = help(arr, 7)
    @@array << self
  end

  def help(arr, i)
    return arr[i][arr[i].index(':"') + 2, arr[i].length - arr[i].index(':"') - 3]
  end

  def self.all_instances
    @@array
  end

  """def print_films
    for i in [0..@@array.length-1]
      puts @@array[i].id
    end
  end"""

end

film = []

f0 = Film.new(arr_films[0])
f1 = Film.new(arr_films[1])
f2 = Film.new(arr_films[2])
#:id, :rank, :title, :year, :image, :crew, :imDbRating, :imDbRatingCount
#puts f0.id, f0.rank, f0.title, f0.year, f0.image, f0.crew, f0.imDbRating, f0.imDbRatingCount

aaa = Film.all_instances
"""for i in [0..aaa.length - 1]
  puts aaa[i].id
end"""


"""for i in [0..0]
  puts arr_films[i]
  film << Film.new(arr_films[i])
  puts film[i].class
end"""

"""for i in [0..5]
  puts film[i].id
end"""