#!/usr/bin/env ruby

Dir["./lib/*.rb"].each {|file| require file }

DATA_DIR = "/var/fantasyfungol/data/"

#crawlteam do |player|
#  puts player
#  puts worst(player)
#end

array = crawlteam

puts array.inspect


#puts worst(array)
#puts worst(crawlteam)


