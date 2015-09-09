#!/usr/bin/env ruby

require 'json'
require 'plotly'
require 'openssl'

plotly = PlotLy.new('kriptha', 'ye5fccpil2')
DATA_DIR = "/home/mrk/fantasyfungol/data/my/"
ap_plot = Array.new
as_plot = Array.new
player_plot = ""
score_plot = ""

Dir.foreach("#{DATA_DIR}") do |player|
  next if player == '.' or player == '..'
  player_data = JSON.parse(open("#{DATA_DIR}#{player}").read)

  # DATA you want to fetch : example player_name
  #player_name = player_data.fetch("web_name")
  minutes = player_data.fetch("minutes")
  points = player_data.fetch("total_points")
  price = player_data.fetch("now_cost")

  # Calculate score
  player_score = ( minutes / points ) * price 
  ap_plot.insert(-1, "#{player}")
  as_plot.insert(-1, "#{player_score}")

end

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
      puts response['url']
    end
