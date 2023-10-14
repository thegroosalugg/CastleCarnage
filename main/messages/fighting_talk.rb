# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Player vs enemy strike

def shots_fired(attacker, target, damage = 0, outcome)
  critical = "#{attacker[:name]} ⚔️ #{CRITICAL} 💥 #{target[:name]} -#{damage} #{target[:emoji]}"
  missed = "#{attacker[:name]} 💭❓ #{MISSED}"
  on_point = "#{attacker[:name]} ⚔️ #{HIT} 💢 #{target[:name]} -#{damage} #{target[:emoji]}"
  counter = "#{attacker[:name]} 🗯️❗ ⚔️ #{COUNTER} 💢 #{target[:name]} -#{damage} #{target[:emoji]}"

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
  success = "#{SUCCESS} " + "⚔️ " * n
  failed = "#{FLUNKED} " + "😓 " * n

  messages = chance == 1 ? success : failed
  puts text_break(messages, " ", 80)
end
