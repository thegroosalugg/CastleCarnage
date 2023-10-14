# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Player vs enemy strike

def shots_fired(attacker, target, damage = 0, outcome)
  critical = "#{attacker[:name]} ⚔️ \e[38;5;208m𝙲𝚁𝙸𝚃𝙸𝙲𝙰𝙻\e[0m 💥 #{target[:name]} -#{damage} #{target[:emoji]}"
  missed = "#{attacker[:name]} 💭❓ \e[34m𝘔𝘐𝘚𝘚\e[0m"
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
  success = "\e[32m𝓢𝓤𝓒𝓒𝓔𝓢𝓢\e[0m " + "⚔️ " * n
  failed = "\e[31m𝓢𝓣𝓐𝓒𝓚𝓔𝓓 𝓘𝓣\e[0m " + "😓 " * n

  messages = chance == 1 ? success : failed
  puts text_break(messages, " ", 80)
end
