#
# This lib is to build a plot about your worst performing players
#
def worst(players)
  ap_plot = Array.new
  as_plot = Array.new
  player_plot = ""
  players.each do |player|
    player_data = JSON.parse(open("#{DATA_DIR}#{player}").read)
    minutes = player_data.fetch("minutes")
    points = player_data.fetch("total_points")
    next if points == 0
    next if points < 0
    price = player_data.fetch("now_cost")
    player_score = ( minutes / points ) * price 
    ap_plot.insert(-1, "#{player}")
    as_plot.insert(-1, "#{player_score}")
  end
  player_plot = worstplot(ap_plot, as_plot)
  return player_plot
end

def worstplot(ap_plot, as_plot)
  plotly = PlotLy.new('kriptha', 'ye5fccpil2')
  puts "#{ap_plot}"
  puts "#{as_plot}"
  data = [
        { x: ap_plot ,
          y: as_plot
        } 
      ]
      args = {
        filename: 'antirendiment',
        fileopt: 'overwrite',
        style: { type: 'bar', barmode: 'group' },
        layout: {
          title: 'FPL Antirendiment Equip'
        },
        world_readable: true
      }
    plotly.plot(data, args) do |response|
    Launchy.open(response['url'])
    return response['url']
    end
end
