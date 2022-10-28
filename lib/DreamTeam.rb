# frozen_string_literal: true

require_relative "DreamTeam/version"

module DreamTeam
  class Error < StandardError; end
  require_relative "DreamTeam/Games/html_games_table"
  require_relative  "DreamTeam/Games/parsing_games"
  require_relative  "DreamTeam/Films/html_table"
  require_relative  "DreamTeam/Films/parsing_films"
  require_relative  "DreamTeam/html_main"
end
