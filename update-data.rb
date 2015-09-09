#!/usr/bin/env ruby

require 'rubygems'
require 'open-uri'
require 'json'


DATA_DIR="data"
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)

BASE_URL = "http://fantasy.premierleague.com/web/api/elements/"

(1..600).each do |i|
  player_url = BASE_URL + "#{i}"
  puts "Fetching #{player_url}" 
  begin
    player_data = JSON.parse(open(player_url).read)
    player_content = open(player_url).read
  rescue Exception=>e
      puts "Error: #{e}"
      sleep 5
  else
    player_name = player_data.fetch("web_name")
    puts "Player name : #{player_name}"
    local_fname = "#{DATA_DIR}/#{File.basename(player_name)}"
    File.open(local_fname, 'w'){|file| file.write(player_content)}
    puts "\t...Success, saved to #{local_fname}"
  ensure
    sleep 1.0 + rand
  end
end

