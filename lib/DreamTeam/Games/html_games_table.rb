require_relative 'parsing_games'

def create_table_with_user_game(path, user_id)
  file_html = File.new(path + "/table_game.html", "w+")
  user_info = get_user_information(user_id)
  file_html.puts "<style type='text/css'>
          .table {
              width: 100%;
              border: none;
              margin-bottom: 20px;
          }
          .table thead th {
              font-weight: bold;
              text-align: left;
              border: none;
              padding: 10px 15px;
              background: #d8d8d8;
              font-size: 14px;
          }
          .table thead tr th:first-child {
              border-radius: 8px 0 0 8px;
          }
          .table thead tr th:last-child {
              border-radius: 0 8px 8px 0;
          }
          .table tbody td {
              text-align: left;
              border: none;
              padding: 10px 15px;
              font-size: 14px;
              vertical-align: top;
          }
          .table tbody tr:nth-child(even){
              background: #f3f3f3;
          }
          .table tbody tr td:first-child {
              border-radius: 8px 0 0 8px;
          }
          .table tbody tr td:last-child {
              border-radius: 0 8px 8px 0;
          }
          </style>

          <table class='table'>
                <thead>
                    <img src = '#{user_info[:avatar]}'>
                    #{user_info[:username]}
                    <tr>
                        <th>Game</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Developers</th>
                        <th>Date</th>
                        <th>Description</th>
                        <th>Recommendation</th>
                        <th>Time In The Game</th>
                    </tr>
                </thead>
          <tbody>"

  games_information = information_of_games(get_user_games(user_id))
  games_information.each do |elem|
    file_html.puts "<tr>"
    file_html.puts "<th>"
    if elem[:name].nil?
      file_html.puts "<span style = 'font-size:20pt'> - </span>"
    else
      file_html.puts elem[:name]
    end
    file_html.puts "</th>"
    file_html.puts "<th>"
    file_html.puts "<img src = '#{elem[:img]}'
                        width = '220'
                        height = '102'
                        alt = 'Picture of the game'>"
    file_html.puts "</th>"
    file_html.puts "<th>"
    if elem[:price].nil?
      file_html.puts "<span style = 'font-size:20pt'> - </span>"
    else
      file_html.puts elem[:price]
    end
    file_html.puts "</th>"
    file_html.puts "<th>"
    if elem[:developers].nil?
      file_html.puts "<span style = 'font-size:20pt'> - </span>"
    else
      file_html.puts elem[:developers]
    end
    file_html.puts "</th>"
    file_html.puts "<th>"
    if elem[:date].nil?
      file_html.puts "<span style = 'font-size:20pt'> - </span>"
    else
      file_html.puts elem[:date]
    end
    file_html.puts "</th>"
    file_html.puts "<th>"
    if elem[:desc].nil?
      file_html.puts "<span style = 'font-size:20pt'> - </span>"
    else
      file_html.puts elem[:desc]
    end
    file_html.puts "</th>"
    file_html.puts "<th>"
    if elem[:recommendations].nil?
      file_html.puts "<span style = 'font-size:20pt'> - </span>"
    else
      file_html.puts elem[:recommendations]
    end
    file_html.puts "</th>"
    file_html.puts "<th>"
    if elem[:time] == 0
      file_html.puts "0"
    else
      file_html.puts "#{elem[:time].to_i / 60}h #{-(elem[:time].to_i / 60 * 60 - elem[:time].to_i)}min"
    end
    file_html.puts "</th>"
    file_html.puts "</tr>"
  end
  file_html.puts "</tbody>
                      </table>"
  file_html.close
end
