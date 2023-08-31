# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

ROOM_NAMES = [
  { name: "💡 Glowing Light Room", probability: (1..9).to_a },
  { name: "📙 Musty Library", probability: (1..9).to_a },
  { name: "🏴‍☠️ Treasure Chamber", probability: (1..9).to_a },
  { name: "😱 Dark Cellar", probability: (1..9).to_a },
  { name: "🩲👙 Jacuzzi Room", probability: (1..9).to_a },
  { name: "🚓 Dracula's Royce", probability: (1..9).to_a },
  { name: "🍽 Dining Room", probability: (1..9).to_a },
  { name: "🏰🌔 Roof", probability: (1..9).to_a },
  { name: "📺 Lounge", probability: (1..9).to_a },
  { name: "🖼 Secret Door Behind the Painting", probability: (1..9).to_a },
  { name: "🕳 Trapdoor Under the Carpet", probability: (1..9).to_a },
  { name: "🔲 Window", probability: (1..9).to_a },
  { name: "🕋 Nightclub", probability: (1..9).to_a }
]

def inside_room(selected_room, enemy, weapon, player, second_enemy)
  print `clear`
  puts "You bolted off to the #{selected_room[:name]}"

  puts "[DEBUG: #{selected_room[:probability]}]"

  randomizer = rand(1..8) == 1 ? rand(30..120) : rand(20..50)
  case selected_room[:probability]
  when 1
    puts "Holy shit! Some food! Better eat up. You gained #{randomizer} HP!"
    player[:hp] += randomizer
  when 2
    puts "Blyat! Shouldn't have come here. Enemy gained #{randomizer} HP!"
    enemy[:hp] += randomizer if enemy
    second_enemy[:hp] += randomizer if second_enemy
  when 3
    puts "Bollocks, you stepped into a bear trap, this is gonna cost ya! You lost #{randomizer} HP!"
    player[:hp] -= randomizer
  when 4
    puts "Booya, running after you the #{enemy[:name]} ate a bomb!. #{enemy[:name]} lost #{randomizer} HP"
    enemy[:hp] -= randomizer if enemy
    second_enemy[:hp]-= randomizer if second_enemy
  when 5..7
    weapon = rand(1..5) == 1 ? special_weapon : pick_weapon
    puts "Gift! There's a #{weapon[:name]} here! Looks like the foot's on the other shoe!"
  when 8
    if second_enemy.nil?
      second_enemy = random_enemy
      puts "Oh fuck! You just dun goofed, #{second_enemy[:name]} jumped out at you!"
    elsif enemy.nil?
      enemy = random_enemy
      puts "Motherfucker, #{enemy[:name]} sprung out the fridge, he coming right for ya!"
    else
      puts "You have an ominous feeling someone was just here"
    end
  when 9
    puts "You searched the room but found nothing."
  end
  return enemy, weapon, second_enemy
end

def explore_rooms(enemy, weapon, player, second_enemy)
  selected_rooms = ROOM_NAMES.sample(3).map(&:dup)  # Create a deep copy of selected rooms

  enemy ? run_away(enemy) : run_away(second_enemy)

  selected_rooms.each_with_index do |room, i|
    room[:probability] = room[:probability].sample  # Modify probability only for the loop
    puts "    [#{i + 4}] (DEBUG: #{room[:probability]}) #{room[:name]}"
  end

  user_choice = 0

  until [4, 5, 6].include?(user_choice)
    user_choice = gets.chomp.to_i
    error_message
    state_of_game(enemy, second_enemy, player, weapon)
    selected_rooms.each_with_index { |room, i| puts "    [#{i + 4}] [DEBUG: #{room[:probability]}] #{room[:name]}" }
  end
  selected_room = selected_rooms[user_choice - 4]
  inside_room(selected_room, enemy, weapon, player, second_enemy)
end
