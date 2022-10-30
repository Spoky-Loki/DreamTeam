require_relative 'Games/html_games_table'
require_relative 'Films/html_films_table'
require 'erb'

module DreamTeam
  module Html_main
    class Html_main_page
      def self.create_main(path, steam_id)
        create_table_with_user_games(path, steam_id)
        create_table_with_film(path)

        erb_str = File.read(File.dirname(__FILE__) + '/main_page.html.erb')

        @path = path
        renderer = ERB.new(erb_str)
        result = renderer.result(binding)

        File.open(path + "/table_main.html", 'w') do |f|
          f.write(result)
        end
      end
    end
  end
end
