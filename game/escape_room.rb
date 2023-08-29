# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

ROOM_NAMES = [
  { name: "Glowing Light Room", probability: (1..19).to_a },
  { name: "Musty Library", probability: (1..19).to_a },
  { name: "Treasure Chamber", probability: (1..19).to_a },
  { name: "Dark Cellar", probability: (1..19).to_a },
  { name: "Jacuzzi Room", probability: (1..19).to_a },
  { name: "Dracula's Royce", probability: (1..19).to_a },
  { name: "Dining Room", probability: (1..19).to_a },
  { name: "The Roof", probability: (1..19).to_a },
  { name: "The Lounge", probability: (1..19).to_a },
  { name: "Secret door behind the painting of the old woman", probability: (1..19).to_a },
  { name: "Trapdoor under the carpet", probability: (1..19).to_a },
  { name: "Through the window", probability: (1..19).to_a }
]

def inside_room(selected_room, enemy, weapon, player, second_enemy)
  puts "You bolted off to the #{selected_room[:name]}"
  puts "#{selected_room[:probability]}"
  randomizer = rand(5..25)
  case selected_room[:probability]
  # when 1..3
  #   player[:hp] += randomizer
  #   puts "Holy shit! Some food! Better eat up. You gained #{randomizer} HP!"
  # when 4..6
  #   enemy[:hp] += randomizer
  #   puts "Blyat! Shouldn't have some here. Enemy gained #{randomizer} HP!"
  # when 6..9
  #   player[:hp] -= randomizer
  #   puts "Bollocks, you stepped into a bear trap, this is gonna cost ya! You lost #{randomizer} HP!"
  # when 10..12
  #   enemy[:hp] -= randomizer
  #   puts "Booya, running after you the #{enemy[:name]} ate a bomb!. #{enemy[:name]} lost #{randomizer} HP"
  when 1..10
    weapon = pick_weapon
    puts "Gift! There's a #{weapon[:name]} here! Looks like the foot's on the other shoe!"
  when 11..19
    if second_enemy.nil?
      second_enemy = random_enemy
      puts "Oh fuck! You just dun goofed, #{second_enemy[:name]} jumped out at you!"
    else
      puts "You have an ominous feeling someone was just here"
    end
  # when 19
  #   puts "You searched the room but found nothing."
  end
end

def explore_rooms(enemy, weapon, player, second_enemy)
  selected_rooms = ROOM_NAMES.sample(3).map(&:dup)  # Create a deep copy of selected rooms

  selected_rooms.each_with_index do |room, i|
    room[:probability] = room[:probability].sample  # Modify probability only for the loop
    puts "[#{i + 1}] (DEBUG: #{room[:probability]}) #{room[:name]}"
  end

  puts "Fuck, gotta pick a gaff quick, or I'm #{enemy[:name]} food!!"
  user_choice = gets.chomp.to_i

  until [1, 2, 3].include?(user_choice)
    print `clear`
    selected_rooms.each_with_index { |room, i| puts "[#{i + 1}] (DEBUG: #{room[:probability]}) #{room[:name]}" }

    puts "Don't be a pillock!"
    user_choice = gets.chomp.to_i
  end
  selected_room = selected_rooms[user_choice - 1]
  inside_room(selected_room, enemy, weapon, player, second_enemy)
end
