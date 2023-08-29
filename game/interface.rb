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
state_of_game(enemy, second_enemy, player)

while (enemy || second_enemy) && player[:hp] > 0

  if weapon[:durability] > 0
    puts "Whatcha ya gonna do?"
    puts "🐱‍👤 [t]: T is for time to die fucker!"
    puts "  ➰  [r]: Try a sommersault!"
    puts "  👟  [y]: Fuckin' leg it!"
    user_action = gets.chomp.downcase
  else
    print `clear`
    puts "Oh shit! Your #{weapon[:name]} broke! Better leg it!"
    # state_of_game(enemy, second_enemy, player)
    user_action = "y"
  end

  if user_action == "t"
    print `clear`

    player_attack(enemy, weapon) if enemy
    enemy_attack(enemy, player) if enemy

    puts "______________________________________________________________________" if second_enemy
    player_attack(second_enemy, weapon) if second_enemy
    enemy_attack(second_enemy, player) if second_enemy
    puts "______________________________________________________________________" if second_enemy

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
    print `clear` if weapon[:durability] > 0
    # state_of_game(enemy, second_enemy, player)
    enemy, weapon, second_enemy = explore_rooms(enemy, weapon, player, second_enemy)

  else
    print `clear`
    puts "______________________________________________________________________"
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

  if player[:hp] <= 0
    tracked_enemy = second_enemy if second_enemy
  else
    tracked_enemy = enemy if enemy
  end

  state_of_game(enemy, second_enemy, player)
end

enemy == nil && second_enemy == nil && player[:hp] > 0 ? win_message(tracked_enemy) : lose_message(tracked_enemy)
