# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def blood_ritual(player, user_choice, price_paid, multiplier, boost)
  boost = boost == :attack ? "💢 attack" : "🛡️ block"

  buff_up = "\e[37m𝓑𝓤𝓕𝓕\e[0m -#{price_paid} #{player[:emoji]} / +#{multiplier} #{boost}"
  get_money = "\e[32m🄲🄰🅂🄷\e[0m -#{price_paid} #{player[:emoji]} / +#{multiplier} 💵"
  sober_up = "\e[38;5;208mℍ𝔸ℕ𝔾𝕆𝕍𝔼ℝ\e[0m -#{price_paid} #{player[:emoji]} / -#{multiplier} 🍺"
  munch_out = "\e[32m𝙃𝙋\e[0m +#{price_paid} #{player[:emoji]} / -#{multiplier} #{boost}"

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
