#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'net/http'


class Crawlteam
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
  page.css('div.ismPlayerContainer dl.ismElementDetail dt span.ismElementText.ismPitchWebName.JS_ISM_NAME').each do |playername|
    puts playername.text
  end
end
