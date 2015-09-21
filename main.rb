#!/usr/bin/env ruby

require 'highline/import'
require 'json'
require 'nokogiri'
require 'open-uri'
require 'plotly'
require 'openssl'

Dir["./lib/*.rb"].each {|file| require file }

DATA_DIR = "/var/fantasyfungol/data/"
BASE_URL = "http://fantasy.premierleague.com/web/api/elements/"
#TEAM = "2479888"
TEAM = "763137"


puts "Welcome to Fantasy Fungol stats app! "
loop do
  choose do |menu|
    menu.prompt = "Please choose an action:  "

    menu.choice(:"Worst performing players") { puts worst(crawlteam) }
    menu.choice(:"Interesting transfers") { transfers }
    menu.choice(:"Update player data (can take up to 10 minutes...) ") { updatedata }
  end
  puts ""
  puts ""
end

