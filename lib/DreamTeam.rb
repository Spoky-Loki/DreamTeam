# frozen_string_literal: true

require_relative "DreamTeam/version"

module DreamTeam
  class Error < StandardError; end
  require_relative "DreamTeam/Games/html_games_table"
  require_relative "DreamTeam/Games/parsing_games"
  require_relative "DreamTeam/Films/html_films_table"
  require_relative "DreamTeam/Films/parsing_films"
  require_relative "DreamTeam/html_main"
end

DreamTeam::Html_main::Html_main_page.create_main("C:","7271666506")
