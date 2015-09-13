#!/usr/bin/env ruby

require 'json'

def gameweek
  files = Dir.entries("#{DATA_DIR}")
  player = files.sample
  player_data = JSON.parse(open("#{DATA_DIR}#{player}").read)

  fixtures = player_data.fetch("fixtures")
  summary = fixtures.fetch("summary")
  nextmatch = summary[0]
  return nextmatch[0]
end
