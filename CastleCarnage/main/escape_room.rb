# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

ROOM_NAMES = [
  { probability: [1, 2, 5, 5, 6, 7], name: "🖼 The Secret Door Behind the Painting" },
  { probability: [2, 4, 5, 5, 5, 6, 6, 7], name: "🚇 The Abandoned Underground Tunnels" },
  { probability: [1, 2, 3, 4, 5, 5, 5, 7], name: "🕳  The Trapdoor Under the Carpet" },
  { probability: [1, 2, 3, 4, 5, 5, 5, 6, 6], name: "❓ The Super Secret Mystery Room" },
  { probability: [1, 1, 2, 3, 3, 6, 7], name: "🍽 The High Society Dining Room" },
  { probability: [1, 2, 3, 4, 5, 5, 6], name: "💡 The Glowing Light Room" },
  { probability: [2, 4, 5, 5, 5, 6, 6, 7], name: "🕋 The Buzzin' Nightclub" },
  { probability: [2, 2, 5, 5, 5, 5, 6], name: "🏴 The Treasure Chamber" },
  { probability: [1, 1, 1, 3, 3, 5, 6, 7], name: "🛁 The Manky Bathroom" },
  { probability: [1, 3, 4, 5, 5, 6, 7], name: "🛌 The Master Bedroom" },
  { probability: [2, 4, 5, 7], name: "🔲 The Wobbly Window" },
  { probability: [1, 2, 5, 5, 6, 7], name: "📚 The Musty Library" },
  { probability: [1, 3, 5, 5, 6, 7], name: "📺 The Fancy Lounge" },
  { probability: [2, 4, 5, 5, 5, 5, 6, 6, 7], name: "😱 The Dodgy Cellar" },
  { probability: [1, 3, 5, 6, 7], name: "🩲 The Jacuzzi Room" },
  { probability: [2, 4, 5, 6, 7], name: "🚓 Dracula's Royce" },
  { probability: [1, 2, 3, 4, 5, 5, 6, 7], name: "🏰 The Roof" },
]

def inside_room(selected_room, enemy, weapon, player, second_enemy)
  print `clear`
  enter_room(selected_room)
  randomizer = rand(1..8) == 1 ? rand(50..120) : rand(20..50)

  case selected_room[:probability]
  when 1
    gained_health(player, randomizer)
    player[:hp] += randomizer
  when 2
    lost_health(player, randomizer)
    player[:hp] -= randomizer
  when 3
    target_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy
    target_enemy[:hp] += randomizer
    enemy_health(randomizer, target_enemy)
  when 4
    target_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy
    target_enemy[:hp] -= randomizer
    enemy_trap(randomizer, target_enemy)
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
  when 7
    empty_room
  end
  return enemy, weapon, second_enemy
end

def explore_rooms(enemy, weapon, player, second_enemy)
  selected_rooms = ROOM_NAMES.sample(4).map(&:dup)  # Create a deep copy of selected rooms

  selected_rooms.each_with_index do |room, i|
    room[:probability] = room[:probability].sample  # Modify probability only for the loop
    puts "    [#{i + 4}] #{room[:name]}"
  end

  user_choice = 0

  until [4, 5, 6, 7].include?(user_choice)
    user_choice = gets.chomp.to_i
    error_message
    state_of_game(enemy, second_enemy, player, weapon)
    selected_rooms.each_with_index { |room, i| puts "    [#{i + 4}] #{room[:name]}" }
  end
  selected_room = selected_rooms[user_choice - 4]
  inside_room(selected_room, enemy, weapon, player, second_enemy)
end
