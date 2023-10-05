# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def explore_rooms(enemy, weapon, player, second_enemy)
  user_choice = 0
  chosen_rooms = room_vault

  until (4..7).include?(user_choice) # index +4 / -4 to set user choice to (4..7) instead of (0..3)
    chosen_rooms.each_with_index { |room, i| puts "    [#{i + 4}] #{room[:name]}" }

    user_choice = gets.chomp.to_i
    error_message
    state_of_game(enemy, second_enemy, player, weapon)
  end

  print `clear`
  entered_room = chosen_rooms[user_choice - 4]
  enter_room(entered_room)
  target_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy
  randomizer = rand(1..8) == 1 ? rand(50..120) : rand(20..50)
  gift = entered_room[:chance].sample

  case gift
  when 1 # Player gains health
    player[:hp] += randomizer
  when 2 # Player steps on a trap
    player[:hp] -= randomizer
  when 3 # Enemy gains health
    target_enemy[:hp] += randomizer
  when 4 # Enemy steps on a trap
    target_enemy[:hp] -= randomizer
  when 5 # Get a new weapon; 20% for special weapon
    weapon = rand(1..5) == 1 ? special_weapon : pick_weapon
    weapon_speaks(weapon, :got)
  when 6 # New enemy spawns in empty slot
    if second_enemy.nil?
      second_enemy = random_enemy
      enemy_speaks(second_enemy, :summon)
    elsif enemy.nil? # New enemy spawns in empty slot if second enemy alive? && enemy dead?
      enemy = random_enemy
      enemy_speaks(enemy, :summon)
    else # 2 enemies on your jock? Increase chance of new weapon, 25% chance for special weapon
      weapon = rand(1..4) == 1 ? special_weapon : pick_weapon
      weapon_speaks(weapon, :got)
    end
  end

  gifts(gift, randomizer, player, target_enemy) unless [5, 6].include?(gift)
  return enemy, weapon, second_enemy
end
