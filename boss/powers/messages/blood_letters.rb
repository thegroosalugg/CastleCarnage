# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def blood_ritual(player, user_choice, price_paid, multiplier, boost)
  boost = boost == :attack ? "💢 attack" : "🛡️ block"

  buff_up = "#{BUFF} +#{multiplier} #{boost} / -#{price_paid} #{player[:emoji]}"
  get_money = "#{CASH} +#{multiplier} 💵 / -#{price_paid} #{player[:emoji]}"
  sober_up = "#{HANGOVER} -#{multiplier} 🍺 / -#{price_paid} #{player[:emoji]}"
  munch_out = "#{HP_PLUS} +#{price_paid} #{player[:emoji]} / -#{multiplier} #{boost}"

  messages = case user_choice
  when 4 then buff_up
  when 5 then get_money
  when 6 then sober_up
  when 7 then munch_out
  end
  puts text_break(messages, " ", 80)
end

def drained
  messages = [
    " You had your chance, go fight now ‼ ",
    " Once per turn, you melt ‼ ",
    " Uh-uh! I don't think so ‼ ",
    " You've given nuff blood ‼ ",
    " Soz (but also no) ‼ ",
    " Don't get greedy ‼ ",
    " Next round buddy ‼ ",
  ]

  print `clear`
  puts SEPARATOR
  puts padding_generator(messages.sample, "🩸", 52)
end
