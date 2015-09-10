#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'net/http'


def crawlteam
  team = "2479888"
  event = 4
  a_player = Array.new
#  loop do
#    event = event + 1
#    uri = URI.parse("http://es.fantasy.premierleague.com/entry/#{team}/event-history/#{event}/")
#    res = Net::HTTP.get_response(uri)
#    break if res.code == "404"
#  end
#  event = event - 1
  page = Nokogiri::HTML(open("http://es.fantasy.premierleague.com/entry/#{team}/event-history/#{event}/"))
  page.css('div.ismPlayerContainer dl.ismElementDetail dt span.ismElementText.ismPitchWebName.JS_ISM_NAME').each do |playername|
    playername = playername.text
    playername = playername[0...-1]
    playername[0] = ''
    a_player.insert(-1, playername)
  end
  return a_player
end


