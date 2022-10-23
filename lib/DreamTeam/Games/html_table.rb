require_relative 'parsing_games'

def create_table_with_user_game(user_id)
  file_html = File.new("lib/DreamTeam/Games/table.html", "w+")
  file_html.puts "<style>
               .table_dark {
                  font-family: 'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;
                  font-size: 14px;
                  width: 99%;
                  text-align: centre;
                  border-collapse: collapse;
                  background: #252F48;
                  margin: 10px;
               }
              .table_dark th {
                 color: #EDB749;
                 border-bottom: 1px solid #37B5A5;
                 padding: 12px 17px;
              }
              .table_dark td {
                 color: #CAD4D6;
                 border-bottom: 1px solid #37B5A5;
                 border-right:  1px solid #37B5A5;
                 padding: 7px 17px;
              }
              .table_dark tr:last-child td {
                 border-bottom: none;
              }
              .table_dark td:last-child {
                 border-right: none;
              }
              .table_dark tr:hover td {
                 text-decoration: underline;
              }
              </style>

  <table class='table_dark'>
  <tr>
    <th>Game</th>
    <th>Image</th>
    <th>Price</th>
    <th>Developers</th>
    <th>Date</th>
    <th>Description</th>
    <th>Recommendation</th>
    <th>Time In The Game</th>
  </tr>"

  games_information = information_of_games(get_user_games(user_id))
  games_information.each do |elem|
    file_html.puts "<tr>"
      file_html.puts "<th>"
        file_html.puts elem[:name]
      file_html.puts "</th>"
      file_html.puts "<th>"
        file_html.puts "<img src = '#{elem[:img]}'
                          width = '220'
                          height = '102'>"
      file_html.puts "</th>"
      file_html.puts "<th>"
      file_html.puts elem[:price] unless elem[:price].nil?
        file_html.puts "Free or No Price" if elem[:price].nil?
      file_html.puts "</th>"
      file_html.puts "<th>"
        file_html.puts elem[:developers]
      file_html.puts "</th>"
      file_html.puts "<th>"
        file_html.puts elem[:date]
      file_html.puts "</th>"
      file_html.puts "<th>"
        file_html.puts elem[:desc]
      file_html.puts "</th>"
      file_html.puts "<th>"
        file_html.puts elem[:recommendations] unless elem[:recommendations].nil?
        file_html.puts "No Recommendations" if elem[:recommendations].nil?
      file_html.puts "</th>"
      file_html.puts "<th>"
        file_html.puts "#{elem[:time].to_i/60}h #{-(elem[:time].to_i/60*60 - elem[:time].to_i)}min" if elem[:time] != 0
        file_html.puts "0" if elem[:time] == 0
      file_html.puts "</th>"
    file_html.puts "</tr>"
  end
  file_html.puts "</table>"
  file_html.close
end

create_table_with_user_game('user_id')