#!/usr/bin/env ruby

Dir["./lib/*.rb"].each {|file| require file }

DATA_DIR = "/var/fantasyfungol/data/"


array = crawlteam


puts worst(array)


