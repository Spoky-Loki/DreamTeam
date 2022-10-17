require_relative 'parsing_games'

fileHtml = File.new("lib/DreamTeam/Games/table.html", "w+")
fileHtml.puts "<style>
.table_dark {
  font-family: 'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;
  font-size: 14px;
  width: 1500px;
  text-align: left;
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
  border-right:1px solid #37B5A5;
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
} </style>

<table class='table_dark'>
<tr>
    <th>Game</th>
    <th>Price</th>
    <th>Recommend</th>
    </tr>"

gamesInformation = InformationOfGames(GetGamesID)
gamesInformation.each do |elem|
  fileHtml.puts "<tr>"
  elem.each do |_, value|
    fileHtml.puts "<th>"
    fileHtml.puts value
    fileHtml.puts "</th>"
  end
  fileHtml.puts "</tr>"
end

fileHtml.puts "</table>"
fileHtml.close