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
