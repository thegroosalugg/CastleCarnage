# rubocop:disable all
require_relative 'enemies_weapons'
require_relative 'phrases'
require_relative 'attack_mode'
require_relative 'escape_room'
#-----------------------------YOUR CODE BELOW---------------------------------->

print `clear`

player = { hp: rand(50..99), block: (1..10).to_a }
enemy = random_enemy
second_enemy = nil
weapon = pick_weapon

intro_enemy(enemy)
intro_weapon(weapon, enemy)

puts "#{enemy[:name]} HP: #{enemy[:hp].to_i}"
puts "Your 💖 HP: #{player[:hp].to_i}"

while enemy[:hp] > 0 && player[:hp] > 0
  puts "Whatcha ya gonna do?"
  puts "[t]: T is for time to die fucker! [r]: Try a sommersault! [y]: Fuckin' leg it!"
  user_action = gets.chomp.downcase

  if user_action == "t"
    print `clear`

    player_attack(enemy, weapon)
    enemy_attack(enemy, player)
    if second_enemy != nil
      player_attack(second_enemy, weapon)
      enemy_attack(second_enemy, player)
    end
  elsif user_action == "r"
    print `clear`
    somersault_attack(enemy, weapon, player)

  elsif user_action == "y"
    print `clear`
    explore_rooms(enemy, weapon, player, second_enemy)

  else
    print `clear`
    puts "Don't be a fool"
  end

  if second_enemy.nil?
    puts "#{enemy[:name]} HP: #{enemy[:hp].to_i}"
    puts "Your 💖 HP: #{player[:hp].to_i}"
  else
    puts "#{enemy[:name]} HP: #{enemy[:hp].to_i}"
    puts "#{second_enemy[:name]} HP: #{second_enemy[:hp].to_i}"
    puts "Your 💖 HP: #{player[:hp].to_i}"
  end
end

enemy[:hp] <= 0 ? win_message(enemy) : lose_message(enemy)
