#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'net/http'


def crawlteam
  team = "2479888"
  event = 0
  loop do
    event = event + 1
    uri = URI.parse("http://es.fantasy.premierleague.com/entry/#{team}/event-history/#{event}/")
    res = Net::HTTP.get_response(uri)
    break if res.code == "404"
  end
  event = event - 1
  page = Nokogiri::HTML(open("http://es.fantasy.premierleague.com/entry/#{team}/event-history/#{event}/"))
  page.css('div.ismPlayerContainer dl.ismElementDetail dt span.ismElementText.ismPitchWebName.JS_ISM_NAME').text do |playername|
    #return playername.text
    player = playername
    player = player[0...-1]
    player[0] = ''
  end.map do |playera|
    #player.text.trim
    #player = player.text
    #player = player[0...-1]
    #player[0] = ''
    puts playera.class
  end
end

crawlteam
