# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Player vs enemy strike

def shots_fired(attacker, target, damage = 0, outcome)
  x = rand(3) == 1 ? [ "Motherfucker!", "Bugger it!", "Bloody hell!", "Arses!", "Sod it!", "Bollocks!", "Shit!", "I call hacks!" ].sample : ""
  y = rand(3) == 1 ? [ "🗯️ Ah yeah!", "🗯️ I own it!", "🗯️ Take that!", "🗯️ I'm jus' too good", "🗯️ Bow to me!" ].sample : ""
  z = rand(3) == 1 ? [ "Not tonight!", "Not with that shirt!", "Piss off!", "Get lost!", "You can't afford it!" ].sample : ""
  critical = "#{attacker[:name]} #{y} ⚔️ #{CRITICAL} 💥 #{target[:name]} -#{damage} #{target[:emoji]}"
  missed = "#{attacker[:name]} 💭❓#{x} #{MISSED}"
  on_point = "#{attacker[:name]} #{y} ⚔️ #{HIT} 💢 #{target[:name]} -#{damage} #{target[:emoji]}"
  counter = "#{attacker[:name]} 🗯️❗#{z} ⚔️ #{COUNTER} 💢 #{target[:name]} -#{damage} #{target[:emoji]}"

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
