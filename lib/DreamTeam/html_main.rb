require 'DreamTeam/Games/html_games_table'
require 'DreamTeam/Films/html_table'

module DreamTeam
  module Html_main
    class Html_main_page
      def create_main(path, steam_id)
        create_table_with_user_game(path, steam_id)
        create_table_with_film(path)
        file_html = File.new(path + '/main_table.html', 'w+')
        file_html.puts "<!DOCTYPE html>
          <html>
            <head>
            <title>Заголовок документа</title>
            <style>
            div
            {
              width: 100%; /* Размеры */
              outline: '0';
              border: '0'; /* Белая рамка */
            }
              div2
            {
              border-radius: 30%;
            }
            </style>
            </head>
            <body>
            <div>
            <p border='0'>
            <div2>
              <a href='#{path + '/table_game.html'}'><img src='https://raw.githubusercontent.com/Spoky-Loki/DreamTeam/master/images/logo1.png' width=45% border='0' alt=''></a>
              <a href='#{path + '/table_film.html'}'><img src='https://raw.githubusercontent.com/Spoky-Loki/DreamTeam/master/images/logo2.png' width=45% border='0' alt=''></a>
            </div2>
            </p>
            </div>
            </body>
           </html>"
        file_html.close
      end
    end
  end
end
