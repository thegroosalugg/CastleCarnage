# rubocop:disable all
require_relative 'enemies_weapons'
#-----------------------------YOUR CODE BELOW---------------------------------->

print `clear`

player = { hp: 100, block: rand(1..10) }
enemy = random_enemy
weapon = pick_weapon

puts "#{enemy[:name]} appeared"
puts "There's a #{weapon[:name]} on the floor, better get it"

while enemy[:hp] > 0
  puts "What you gonna do?"
  puts "[q]: Attack [w]: Block [e]: Dodge"
  user_action = gets.chomp.downcase

  if user_action == "q"
    print `clear`
    puts "#{enemy[:name]} HP: #{enemy[:hp]}"

    # damage_dealt = weapon[:damage].sample - enemy[:block].sample
    damage_dealt = [weapon[:damage].sample - enemy[:block].sample, 1].max

    enemy[:hp] -= damage_dealt
    weapon[:durability] -= 1
    puts "You attacked #{enemy[:name]} with #{weapon[:name]} for #{damage_dealt} damage!"
  elsif user_action == "w"
    # Implement blocking logic
  elsif user_action == "e"
    # Implement dodging logic
  else
    print `clear`
    puts "Don't be a fool"
  end
end

puts "#{enemy[:name]} defeated!"
