require_relative 'parsing_films'
require 'erb'
def create_table_with_film(path)
  erd_str = File.read('lib/DreamTeam/Films/films_page.html.erb')
  filmsInformation = get_all_films(get_films_id())
  @films_information = filmsInformation
  renderer = ERB.new(erd_str)
  result = renderer.result(binding)
  File.open(path + "/table_film.html", 'w') do |f|
    f.write(result)
    end
end
