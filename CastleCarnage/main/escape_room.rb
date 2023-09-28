# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def explore_rooms(enemy, weapon, player, second_enemy)
  user_choice = 0
  chosen_rooms = room_vault

  #puts chosen_rooms # DEBUG INFO

  until (4..7).include?(user_choice) # index +4 / -4 to set user choice to (4..7) instead of (0..3)
    chosen_rooms.each_with_index { |room, i| puts "    [#{i + 4}] #{room[:name]} [CHANCE] #{room[:chance]}" } # DEBUG INFO (remove roomchance)

    user_choice = gets.chomp.to_i
    error_message
    state_of_game(enemy, second_enemy, player, weapon)
  end

  print `clear`
  entered_room = chosen_rooms[user_choice - 4]
  enter_room(entered_room)
  randomizer = rand(1..8) == 1 ? rand(50..120) : rand(20..50)
  gift = entered_room[:chance].sample
  puts "[CHANCE] #{gift}" # DEBUG INFO

  case gift
  when 1
    player[:hp] += randomizer
  when 2
    player[:hp] -= randomizer
  when 3
    target_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy
    target_enemy[:hp] += randomizer
  when 4
    target_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy
    target_enemy[:hp] -= randomizer
  when 5
    weapon = rand(1..5) == 1 ? special_weapon : pick_weapon
    got_weapon(weapon)
  when 6
    if second_enemy.nil?
      second_enemy = random_enemy
      enemy_spawn(second_enemy)
    elsif enemy.nil?
      enemy = random_enemy
      enemy_spawn(enemy)
    else
      weapon = rand(1..5) == 1 ? special_weapon : pick_weapon
      got_weapon(weapon)
    end
  end

  gifts(gift, randomizer, player, enemy) unless [5, 6].include?(gift)
  return enemy, weapon, second_enemy
end
