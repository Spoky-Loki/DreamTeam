def create_main_table()
  file_html = File.new('lib/DreamTeam/main_table.html', 'w+')
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
    <a href='Games/table.html'><img src='../../images/logo1.png' width=45% border='0' alt=''></a>
    <a href='Films/table.html'><img src='../../images/logo2.png' width=45% border='0' alt=''></a>
    </div2>
  </p>
  </div>
</body>
</html>"
  file_html.close
end

#create_main_table()
