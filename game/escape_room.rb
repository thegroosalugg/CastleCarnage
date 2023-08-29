# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# ROOM_NAMES = [
#   "Glowing Light Room",
#   "Musty Library",
#   "Treasure Chamber",
#   "Dark Cellar",
#   "Jacuzzi Room",
#   "Dracula's Royce",
#   "Dining Room",
#   "Up to the Roof",
#   "The Lounge",
#   "Secret door behind the painting of the old woman",
#   "Trapdoor under the carpet",
#   "Try to climb through the window"
# ]

ROOM_NAMES = [
  { name: "Glowing Light Room", probability: (1..10).to_a },
  { name: "Musty Library", probability: (1..10).to_a },
  { name: "Treasure Chamber", probability: (1..10).to_a },
  { name: "Dark Cellar", probability: (1..10).to_a },
  { name: "Jacuzzi Room", probability: (1..10).to_a },
  { name: "Dracula's Royce", probability: (1..10).to_a },
  { name: "Dining Room", probability: (1..10).to_a },
  { name: "Up to the Roof", probability: (1..10).to_a },
  { name: "The Lounge", probability: (1..10).to_a },
  { name: "Secret door behind the painting of the old woman", probability: (1..10).to_a },
  { name: "Trapdoor under the carpet", probability: (1..10).to_a },
  { name: "Try to climb through the window", probability: (1..10).to_a }
]


def explore_rooms(enemy, weapon, player, second_enemy)
  selected_rooms = ROOM_NAMES.sample(3)
  selected_rooms.each_with_index do |room, i|
    puts "[#{i + 1}] #{room[:name]} #{room[:probability].sample}"
  end
  puts "Fuck, gotta pick a gaff quick, or I'm #{enemy[:name]} food!!"
  user_choice = gets.chomp.to_i
  if user_choice >= 1 && user_choice <= 3
    room_probability = selected_rooms[user_choice - 1][:probability].sample

    print `clear`

    case room_probability
    when 1..2
      # Enemy gains health
      enemy[:hp] += rand(5..25).to_i
      puts "#{enemy[:name]} gained health! His HP is now #{enemy[:hp]}."
    when 3..5
      # Player gains health
      player[:hp] += rand(8..25)
      puts "You gained health! Your HP is now #{player[:hp]}."
    when 6..8
      # Player gets a new weapon
      weapon = pick_weapon
      puts "You found a new weapon: #{weapon[:name]}!"
    when 9
      if second_enemy.nil?
        second_enemy = random_enemy
        puts "#{second_enemy[:name]} suddenly appeared!"
      else
        puts "There's nothing here."
      end
    when 10
      puts "There's nothing here."
    end
  else
    puts "Don't be a pillock!"
  end
end
