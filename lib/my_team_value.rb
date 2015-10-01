# to be documented
def my_team_value(players)
  puts ""
  puts ""
  players.each do |player|
    player_data = JSON.parse(open("#{DATA_DIR}#{player}").read)
    points = player_data.fetch("total_points")
    minutes = player_data.fetch("minutes")
    price = player_data.fetch("now_cost")
    player_ppm = ppm(points,minutes)
    player_ppmpp = ppmpp(player_ppm,price)
    player_ppg = ( player_ppm * 90 )
    player_ppgpp = ( player_ppmpp * 90 )
    printf(" %15s ppm: %15f ppmpp: %f ppg: %f ppgpp: %f\n", player, player_ppm, player_ppmpp,player_ppg,player_ppgpp) 
  end 
end
