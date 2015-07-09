#! /usr/bin/env ruby
require 'byebug'
require_relative '../lib/jibe'

puts 'Begin Jibe Coding Challenge'

prime_list = Jibe::Prime.first(ARGV.first.to_i || 10)

Jibe::MultiplicationTable.print(prime_list)

puts "Beer Levels: #{Jibe::BeerPyramid.levels(ARGV.first.to_i || 10)}"