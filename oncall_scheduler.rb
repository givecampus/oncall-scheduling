require "date"
require "active_support/all"

def print_divider
  puts "------------------------------"
end

start_date = Date.new(2025, 10, 27) # Make this the Monday of the 1st weekday shift you want to generate
current_date = start_date

names = [
  "Alejandro Vasquez",
  "Alex Mitchell",
  "Athif Wulandana",
  "Carl Weis",
  "Connor Devlin",
  "Duncan Morrissey",
  "Hassaan Ejaz",
  "Hunter Stevens",
  "Joshua Born",
  "Lane Russell",
  "Marcus Bernales",
  "Matt Gruber",
  "May Miller-Ricci",
  "Michael Deutsch",
  "Pete Hanner",
  "Sam David",
  "Sam Eckmeier",
  "Sarah Eisen",
  "Sam Wlody",
].shuffle

maybe_add = [
  "Jacob Cho",
  "David Ruiz",
]

removed_people = [
    "Alex Villela",
    "Matt Price",
    "Jackie Lee",
    "Peter Szczepanski",
    "Mike Dworken",
]

pairs = []
pair_count = names.length / 2
pair_count.times.each do |i|
  pairs << {engineer_one: names.pop, engineer_two: names.pop}
end

puts "Pairings:"
print_divider
if names.size == 1
  pairs << {engineer_one: "TBD", engineer_two: names[0]}
end

puts pairs

print_divider

iterations = ARGV.first.to_i

puts "Schedule:"
print_divider
iterations.times.each do |i|
  pairs.each do |pair|
    if i.even?
      original_date = current_date.dup
      current_date += 4.days
      puts "#{original_date.strftime("%B %-d")} - #{current_date.strftime("%B %-d")} (Weekday)\t#{pair[:engineer_one]}\t#{pair[:engineer_two]}"

      original_date = current_date.dup
      current_date += 3.days
      puts "#{original_date.strftime("%B %-d")} - #{current_date.strftime("%B %-d")} (Weekend)\t#{pair[:engineer_two]}\t#{pair[:engineer_one]}"
    else
      original_date = current_date.dup
      current_date += 4.days
      puts "#{original_date.strftime("%B %-d")} - #{current_date.strftime("%B %-d")} (Weekday)\t#{pair[:engineer_two]}\t#{pair[:engineer_one]}"

      original_date = current_date.dup
      current_date += 3.days
      puts "#{original_date.strftime("%B %-d")} - #{current_date.strftime("%B %-d")} (Weekend)\t#{pair[:engineer_one]}\t#{pair[:engineer_two]}"
    end
  end

  print_divider
end
