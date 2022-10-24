require_relative 'parsing_films'



fileHtml = File.new("lib/DreamTeam/Films/table.html", "w+")

#fileHtml.puts '<%= form.select :sorting, ["By rating", "By release date. New ones first"] %>'
#<%= form.select :city, ["Berlin", "Chicago", "Madrid"] %>
#select(:sorting, ["By rating", "By release date. New ones first"])

fileHtml.puts '<select name="sorting">
  <option value="rank">By rating</option>
  <option value="year_new">By release date. New ones first</option>
</select>'

"""def sorting(a)
  if (form[:sorting] == 'By rating')
    a.sort do |e1, e2|
      e1.rank <=> e2.rank
    end
  end
  if (form[:sorting] == 'By release date. New ones first')
    a.sort do |e1, e2|
      e2.year <=> e1.year
    end
  end
  return a
end"""




fileHtml.puts "<style>
.table_dark {
  font-family: 'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;
  font-size: 14px;
  width: 90%;
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
} </style>

<table class='table_dark'>
<tr>
    <th>Rang</th>
    <th>Film name</th>
    <th>Full name</th>
    <th>Year</th>
    <th>Image</th>
    <th>The actors</th>
    <th>Rating</th>
    <th>Rating Count</th>

    </tr>"


#filmsInformation = sorting(get_all_films(get_films_id()))
filmsInformation = get_all_films(get_films_id())
filmsInformation.each do |elem|
  fileHtml.puts "<tr>"
  fileHtml.puts "<th>"
  fileHtml.puts elem.rank
  fileHtml.puts "<th>"
  fileHtml.puts elem.title
  fileHtml.puts "<th>"
  fileHtml.puts elem.title_full
  fileHtml.puts "<th>"
  fileHtml.puts elem.year
  fileHtml.puts "<th>"
  fileHtml.puts "<img src = '#{elem.image}'
                          width = '102'
                          height = '160'>"
  fileHtml.puts "<th>"
  fileHtml.puts elem.crew
  fileHtml.puts "<th>"
  fileHtml.puts elem.imDbRating
  fileHtml.puts "<th>"
  fileHtml.puts elem.imDbRatingCount
  fileHtml.puts "<th>"


  fileHtml.puts "</tr>"
end

fileHtml.puts "</table>"
fileHtml.close