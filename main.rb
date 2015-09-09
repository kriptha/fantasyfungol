#!/usr/bin/env ruby

#libdir = File.dirname('lib')
#$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

#require_relative './lib/'
Dir["./lib/*.rb"].each {|file| require file }

Crawlteam do |player|
  puts player
end
