# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Player vs enemy strike

def shots_fired(attacker, target, damage = 0, outcome)
  x = rand(3) == 1 ? [ "Motherfucker!", "Bugger it!", "Bloody hell!", "Arses!", "Sod it!", "Bollocks!", "Shit!", "I call hacks!" ].sample : ""
  y = rand(3) == 1 ? [ "🗯️ Ah yeah!", "🗯️ I own it!", "🗯️ Take that!", "🗯️ I'm jus' too good", "🗯️ Bow to me!" ].sample : ""
  z = rand(3) == 1 ? [ "Not tonight!", "Not with that shirt!", "Piss off!", "Get lost!", "You can't afford it!" ].sample : ""
  critical = "#{attacker[:name]} #{y} ⚔️ #{CRITICAL} 💥 #{target[:name]} -#{damage} #{target[:emoji]}"
  missed = "#{attacker[:name]} 💭❓ #{x} #{MISSED}"
  on_point = "#{attacker[:name]} #{y} ⚔️ #{HIT} 💢 #{target[:name]} -#{damage} #{target[:emoji]}"
  counter = "#{attacker[:name]} 🗯️❗ #{z} ⚔️ #{COUNTER} 💢 #{target[:name]} -#{damage} #{target[:emoji]}"

  x, messages = case outcome
  when :critical then [100, critical]
  when :missed   then [85, missed]
  when :hit      then [100, on_point]
  when :counter  then [100, counter]
  end
  puts text_break(messages, " ", x)
end

def strike(attacker, target, weapon = nil)
  source = attacker[:id] == :player ? weapon : attacker
  damage = rand(source[:attack]) - (target[:id] == :boss ? 0 : rand(target[:block])).clamp(1, 100)

  if rand(source[:crit_ch]) == 1
    critical = (damage * rand(source[:crit_x])).to_i.clamp(1, 150)
    target[:hp] -= critical
    shots_fired(attacker, target, critical, :critical)
  elsif rand(source[:accuracy]) == 1
    shots_fired(attacker, target, :missed)
  else
    target[:hp] -= damage
    shots_fired(attacker, target, damage, :hit)
  end
  weapon[:durability] = [weapon[:durability] - 1, 0].max if attacker[:id] == :player
end

# Sommersault attack

def somersault(chance, n)
  success = "#{SUCCESS} " + "⚔️ " * n
  failed = "#{FLUNKED} " + "😓 " * n

  messages = chance == 1 ? success : failed
  puts text_break(messages, " ", 85)
end

def somersault_attack(player, enemies, weapon)   # succeed and strike twice, fail and get struck thrice
  chance = rand(2)
  n = rand(2..3)
  somersault(chance, n)
  chance == 1 ? n.times { strike(player, enemies.sample, weapon) } : n.times { strike(enemies.sample, player) }
end

# Main game combat

def mortal_kombat(enemies, player, weapon, load_art)
  greeting(:combat)
  user_choice = -1

  until user_choice >= 0 && user_choice < enemies.length
    state_of_game(enemies, player, weapon, load_art = battlefield)
    puts "    Who yer gonna whack:"
    enemies.each_with_index { |enemy, index| puts "    [#{index + 4}] #{enemy[:name]}" }
    user_choice = gets.chomp.to_i - 4

    if user_choice >= 0 && user_choice < enemies.length
      print `clear`
      strike(player, enemies[user_choice], weapon)
      strike(enemies[user_choice], player) if enemies[user_choice][:hp].positive?
    else
      error_message
    end
  end
end

# activates when exploring rooms

def escape_attempt(enemies, player, weapon, load_art)
  target_enemy = enemies.sample
  enemy_speaks(target_enemy, :escape)
  if rand(1..4) == 1
    enemy_speaks(target_enemy, :surprise)
    strike(target_enemy, player)
  end
end