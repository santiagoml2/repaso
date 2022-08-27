require 'faker'
require_relative "lion"
require_relative "meerkat"
require_relative "warthog"

animals = []
animals << Lion.new("Mufasa")
animals << Lion.new("Zimba")
animals << Meerkat.new("Timon")
animals << Warthog.new("Pumba")

animals.each do |animal|
  puts "#{animal.talk} and #{animal.eat(Faker::Creature::Animal.name)}"
end
