# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def run_away(enemy)
  run_msgs = [
    "Fuck, gotta dash to a gaff quick, or I'm #{enemy[:name]} food!!",
    "That bastard #{enemy[:name]} is right behing me, gotta peg it!",
    "Fuck that #{enemy[:name]}'s a bitch, maybe there be something in one of them rooms.",
  ]

  puts run_msgs.sample
  puts "----------------------------------------------------------------------"
end

def enter_room(selected_room)
  room_msg = [
    "You bolted off to #{selected_room[:name]}",
    "You danced 🕺 into #{selected_room[:name]}",
    "You ran and did a mental action dive 🦶 into #{selected_room[:name]}",
    "#{selected_room[:name]} seems like most inticing choice.",
    "'I think I smelled some grub 🥗 in #{selected_room[:name]}, better check it, fuckin' stavin'.",
    "'They won't find me in #{selected_room[:name]}, I'm golden 🥇!'",
    "'Damn I need a shit so bad! Fuck it, #{selected_room[:name]} will do.'",
    "'#{selected_room[:name]} is a perfect place to take a slash'",
  ]

  puts room_msg.sample
end
