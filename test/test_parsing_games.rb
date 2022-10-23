require_relative '../test/test_helper'
require_relative '../lib/DreamTeam/Games/parsing_games'

class ParsingGamesTest < Minitest::Test
  def test_number_of_elements_in_get_user_games
    games = get_user_games('76561198271666506')
    assert_equal(games.size, 26)
  end

  def test_number_of_elements_in_information_of_games
    games_information = information_of_games(get_user_games('76561198271666506'))
    assert_equal(games_information.size, 26)
  end

  def test_first_element
    games_information = information_of_games(get_user_games('76561198271666506'))
    assert_equal(games_information[0][:name], "Garry's Mod")
  end

  def test_name_of_Rogalik
    assert_equal(get_user_information('76561198109538094')[:username], 'Rogalik')
  end

  def test_name_of_SpokyLoki
    assert_equal(get_user_information('76561198271666506')[:username], '丂卩ㄖҜㄚ_ㄥㄖҜ丨')
  end

  #надо выдавать исключение!!!
  #def test_bad_steam_id
  #assert_throws(OpenURI::HTTPError) do
  #information_of_games(get_user_games('45756776879879'))
  #end
  #end
end
