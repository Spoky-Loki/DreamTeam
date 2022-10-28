require_relative "parsing_games"
require 'erb'

def create_table_with_user_games(path, steam_id)
  erb_str = File.read('lib/DreamTeam/Games/games_page.html.erb')

  user_info = get_user_information(steam_id)
  games_information = information_of_games(get_user_games(steam_id))

  @avatar = user_info[:avatar]
  @username = user_info[:username]
  @games_information = games_information
  renderer = ERB.new(erb_str)
  result = renderer.result(binding)

  File.open(path + "/table_game.html", 'w') do |f|
    f.write(result)
  end
end
