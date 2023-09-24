# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def damage_info(the_boss, total_damage)
  dmg_messages = [
   "You smashed #{the_boss[:name]} in for like 💢 #{total_damage} damage, surfs up bro!",
   "Time for a mashing up, #{the_boss[:name]} got weighed in for 💢 #{total_damage} damage!",
  ]

  puts dmg_messages.sample
end
