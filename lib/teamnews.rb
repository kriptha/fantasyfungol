def teamnews(players)
  puts ""
  players.each do |player|
    player_data = JSON.parse(open("#{DATA_DIR}#{player}").read)
    unless (player_data.fetch("news")) == ''
      puts player_data.fetch("web_name") + ": " + player_data.fetch("news")
    end
  end
end
