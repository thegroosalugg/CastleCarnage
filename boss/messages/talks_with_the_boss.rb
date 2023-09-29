# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# end of main game rewards message

def your_rewards(player, health, boost, multiplier)
  boost = boost == :attack ? "💢 attack" : "🛡️ block"

  messages = [
    "You've been blessed, dark magics grant you #{player[:emoji]} #{health} HP, your #{boost} grows by #{multiplier}. Go get 'em.",
  ]

  puts text_break(messages.sample, " ", 70)
end
