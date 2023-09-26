# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def paid_blood_message(user_choice, price_paid, multiplier, boost)
  boost = boost == :attack ? "💢 attack" : "🛡️ block"
  buff_up = [
    "You sacked 🖤 #{price_paid} HP to swole up your #{boost} by 1.",
  ]
  get_money = [
    "You bled 🖤 #{price_paid} HP but you raked in 💵 #{multiplier} cash. Worth it.",
  ]
  sober_up = [
    "🩸 is thicker than 💧. You sacked 🖤 #{price_paid} HP and removed 🍺 #{multiplier} beers.",
  ]
  munch_out = [
    "You got what you wanted and munched up 💗 #{price_paid} HP, but you're bloated, your #{boost} suffers by #{multiplier}."
  ]

  case user_choice
  when 4
    puts buff_up.sample
  when 5
    puts get_money.sample
  when 6
    puts sober_up.sample
  when 7
    puts munch_out.sample
  end
end

def drained_message
  drained_msg = [
    "🩸 Once per turn, you melt ‼",
    "🩸 Uh-uh! I don't think so ‼",
    "🩸 Don't get greedy ‼",
    "🩸 You've donated enough blood ‼",
    "🩸 You had your chance, go fight now ‼",
    "🩸 Soz (Not sorry) ‼",
    "🩸 Next round buddy ‼",
  ]

  left_padding = '*' * 27
  message = drained_msg.sample
  right_padding = '*' * (50 - message.length)

  print `clear`
  puts SEPARATOR
  puts "#{left_padding} #{message} #{right_padding}"
end
