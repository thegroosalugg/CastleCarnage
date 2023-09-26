# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def paid_blood_message(player, user_choice, price_paid, multiplier, boost)
  boost = boost == :attack ? "💢 attack" : "🛡️ block"

  buff_up = [
    "You sacked #{player[:emoji]} #{price_paid} HP to swole up your #{boost} by #{multiplier}.",
  ]
  get_money = [
    "You bled 🖤 #{price_paid} HP but you raked in 💵 #{multiplier} cash. Worth it.",
  ]
  sober_up = [
    "🩸 is thicker than 💧. You sacked 🖤 #{price_paid} HP and removed 🍺 #{multiplier} beers.",
  ]
  munch_out = [
    "You got what you wanted and munched up #{player[:emoji]} #{price_paid} HP, but you're bloated, your #{boost} suffers by #{multiplier}."
  ]

  message = case user_choice
  when 4
    buff_up.sample
  when 5
    get_money.sample
  when 6
    sober_up.sample
  when 7
    munch_out.sample
  end
  puts text_break(message, " ", 70)
end

def drained_message
  messages = [
    " Once per turn, you melt ‼ ",
    " Uh-uh! I don't think so ‼ ",
    " Don't get greedy ‼ ",
    " You've donated enough blood ‼ ",
    " You had your chance, go fight now ‼ ",
    " Soz (Not sorry) ‼ ",
    " Next round buddy ‼ ",
  ]

  print `clear`
  puts SEPARATOR
  puts padding_generator(messages.sample, "🩸", 52)
end
