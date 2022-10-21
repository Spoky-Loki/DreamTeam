require_relative 'parsing_games'

fileHtml = File.new("lib/DreamTeam/Games/table.html", "w+")
fileHtml.puts "<style>
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
    <th>Publishers</th>
    <th>Data</th>
    <th>Description</th>
    <th>Percent of positive reviews</th>
</tr>"

gamesInformation = InformationOfGames(GetGamesID(100))
gamesInformation.each do |elem|
  fileHtml.puts "<tr>"
    fileHtml.puts "<th>"
      fileHtml.puts elem[:name]
    fileHtml.puts "</th>"
    fileHtml.puts "<th>"
      fileHtml.puts "<img src = '#{elem[:img]}'
                          width = '220'
                          height = '102'>"
    fileHtml.puts "</th>"
    fileHtml.puts "<th>"
      fileHtml.puts elem[:price]
    fileHtml.puts "</th>"
    fileHtml.puts "<th>"
      fileHtml.puts elem[:developers]
    fileHtml.puts "</th>"
    fileHtml.puts "<th>"
      fileHtml.puts elem[:publishers]
    fileHtml.puts "</th>"
    fileHtml.puts "<th>"
      fileHtml.puts elem[:data]
    fileHtml.puts "</th>"
    fileHtml.puts "<th>"
      fileHtml.puts elem[:desc]
    fileHtml.puts "</th>"
    fileHtml.puts "<th>"
      fileHtml.puts "#{elem[:positiveReviews].to_i * 100 / elem[:reviews].to_i}%"
    fileHtml.puts "</th>"
  fileHtml.puts "</tr>"
end

fileHtml.puts "</table>"
fileHtml.close