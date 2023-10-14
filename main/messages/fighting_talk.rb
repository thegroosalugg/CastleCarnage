# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Player vs enemy strike

def shots_fired(attacker, target, damage = 0, outcome)
  critical = "#{attacker[:name]} ⚔️ \e[38;5;208m𝙲𝚁𝙸𝚃𝙸𝙲𝙰𝙻\e[0m 💥 #{target[:name]} -#{damage} #{target[:emoji]}"
  missed = "\e[34m𝘔𝘐𝘚𝘚\e[0m #{attacker[:name]} 💭❓"
  on_point = "#{attacker[:name]} ⚔️ \e[31m𝙷𝙸𝚃\e[0m 💢 #{target[:name]} -#{damage} #{target[:emoji]}"
  counter = "#{attacker[:name]} 🗯️❗ ⚔️ \e[36mℂ𝕆𝕌ℕ𝕋𝔼ℝ\e[0m 💢 #{target[:name]} -#{damage} #{target[:emoji]}"

  messages = case outcome
  when :critical then critical
  when :missed   then missed
  when :hit      then on_point
  when :counter  then counter
  end
  puts text_break(messages, " ", 80)
end

# Sommersault attack

def somersault(chance, n)
  success = [
    "You turned Super Saiyan 😼, the scouter 🥽 says your power level is over 9000!",
    "⬇ ↘ ➡ HP LP ⬅ ↖ ⬆ LP ⬆ ↖ ⬅ HK  ⬇ LK HP  ⬇ ↘ ➡ ➡ ⬆ ⬇ HK ⟪⟪Ultra Combo⟫⟫",
    "With outcomes like these 💯 you might win after all, roll 🎲 #{n} times!",
    "You ran up the wall and did a sick backflip, you strike #{n} times!",
    "The gods ⚖ smile upon you, your path is righteous",
    "Bang on ⚖. You get #{n} extra attacks!",
  ]
  failed = [
    "You shouldn't have eaten #{n} pizzas 🍕 before trying to do acrobatics 🤢.",
    "You tripped over your own shoelaces 👞 and knocked yourself out 😵.",
    "You're still pretty wasted 🍻, you can't even stand straight.",
    "It ain't gonna happen today mate 🚷, take bare damage bruv",
    "You stacked 😵 it! They gone have a field day, you plum!",
    "You thought you had it, but you got merked instead 😭",
    "The enemy laughed 😂 and socked 👊 you in the face.",
  ]

  messages = chance == 1 ? success : failed
  puts text_break(messages.sample, " ", 80)
end
