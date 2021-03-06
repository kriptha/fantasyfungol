#
# This lib is to recommend you new transfers. You can choose position you want so search is more acurated
#
def best(position)
  player_array = Array.new
  puts ""
  Dir.foreach("#{DATA_DIR}") do |player|
    next if player == '.' or player == '..'
    player_data = JSON.parse(open("#{DATA_DIR}#{player}").read)
    place = player_data.fetch("type_name")
    next if place != position
    minutes = player_data.fetch("minutes")
    points = player_data.fetch("total_points")
    price = player_data.fetch("now_cost")
    team_name = player_data.fetch("team_name")
    match = player_data.fetch("next_fixture")
    now_cost = player_data.fetch("now_cost")
    next if points == 0
    next if points < 0
    next if points < 30
    player_score = ( minutes / points ) * price 
    player_hash = { :score => player_score, :player => player, :points => points, :team => team_name, :next_match => match, :price => now_cost }
    player_array.insert(-1, player_hash)
    player_array = player_array.sort_by { |a| a[:score] }
    if position == 'Goalkeeper'
#      count = 5
      count = 10
    end
    if position == 'Defender'
#      count = 10
      count = 20
    end
    if position == 'Midfielder'
#      count = 10
      count = 20
    end
    if position == 'Forward'
#      count = 8
      count = 16
    end
    player_array = player_array.take(count)
  end
  player_array.each do |x|
    player = x[:player]
    points = x[:points]
    team = x[:team]
    next_match = x[:next_match]
    price = x[:price]
    printf " %15s %s %s    %s %s    %s %s    %s %s\n", player, "Points:", points, "Team:", team, "Next Match:", next_match, "Price:", price
  end
  return
end

def transfers
  choose do |menu|
    menu.prompt = "Choose a position for looking transfers: "
    menu.choice(:"Goalkeeper") { puts best('Goalkeeper') }
    menu.choice(:"Defender") { puts best('Defender') }
    menu.choice(:"Midfielder") { puts best('Midfielder') }
    menu.choice(:"Forward") { puts best('Forward') }
  end
end

