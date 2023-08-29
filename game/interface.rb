# rubocop:disable all
require_relative 'enemies_weapons'
require_relative 'phrases'
require_relative 'attack_mode'
require_relative 'escape_room'
#-----------------------------YOUR CODE BELOW---------------------------------->

print `clear`

player = { hp: rand(5000..9900), block: (1..10).to_a }
enemy = random_enemy
second_enemy = nil
weapon = pick_weapon

intro_enemy(enemy)
intro_weapon(weapon, enemy)

puts "#{enemy[:name]} HP: #{enemy[:hp].to_i}"
puts "Your 💖 HP: #{player[:hp].to_i}"

while (enemy || second_enemy) && player[:hp] > 0
  puts "Whatcha ya gonna do?"
  puts "[t]⚔: T is for time to die fucker! [r]🤸‍♂️: Try a sommersault! [y]🏃‍♂️: Fuckin' leg it!"
  user_action = gets.chomp.downcase

  if user_action == "t"
    print `clear`

    player_attack(enemy, weapon) if enemy
    enemy_attack(enemy, player) if enemy

    player_attack(second_enemy, weapon) if second_enemy
    enemy_attack(second_enemy, player) if second_enemy

  elsif user_action == "r"
    print `clear`

    if enemy && second_enemy
      random_enemy = [enemy, second_enemy].sample
      somersault_attack(random_enemy, weapon, player)
    elsif enemy
      somersault_attack(enemy, weapon, player)
    elsif second_enemy
      somersault_attack(second_enemy, weapon, player)
    end


  elsif user_action == "y"
    print `clear`
    enemy, weapon, second_enemy = explore_rooms(enemy, weapon, player, second_enemy)

  else
    print `clear`
    puts "Don't be a fool"
  end

  if enemy && enemy[:hp] <= 0
    puts "#{enemy[:name]} died. Bully for you!"
    tracked_enemy = enemy
    enemy = nil
  end

  if second_enemy && second_enemy[:hp] <= 0
    puts "#{second_enemy[:name]} got blasted. "
    tracked_enemy = second_enemy
    second_enemy = nil
  end

  puts "______________________________________________________________________"
  puts "#{enemy[:name]} HP: #{enemy[:hp].to_i}" if enemy
  puts "#{second_enemy[:name]} HP: #{second_enemy[:hp].to_i}" if second_enemy
  puts "Your 💖 HP: #{player[:hp].to_i}"
  puts "______________________________________________________________________"

end

enemy == nil && second_enemy == nil && player[:hp] > 0 ? win_message(tracked_enemy) : lose_message(tracked_enemy)
