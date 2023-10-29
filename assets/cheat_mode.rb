# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# debug cheat menu for interface

def cheat_mode(enemies, player, target)
  case player[:choice]
  when "l" then enemies << random_enemy(player)
  when "." then target[:hp]            -=  20
  when "/" then player[:hp   ]         -=  45
  when ";" then player[:hp   ]         += 100
  when "x" then player[:cash ]         -=   1
  when "c" then player[:cash ]         +=   1
  when "f" then player[:beers]         -=   1
  when "d" then player[:beers]         +=   1
  when "v" then player[:xp]            +=   1
  when "k" then player[:attack]        +=  10; player[:aim] = 10
  when "h" then player[:weapon][:uses] +=   1 if player[:weapon]
  when "j" then weapon_breaks(player)         if player[:weapon]
  when "'" then crap_factory(player, :bonus)
  when "]" then crap_factory(target)
  when "n" then  weapon_wakes(player, player, :bonus)
  when "b" then  weapon_wakes(target, player)
  when "," then  print_player(player)
  when "m" then print_enemies(enemies)
  when "p" then cheat_menu(enemies, player, target)
  when "2" then rochambeau(enemies, player, target)
  when "1" then  blackjack(enemies, player, target)
  when "3" then  coin_flip(enemies, player, target)
  end
  player[:weapon][:uses] = player[:weapon][:uses].clamp(0, 5) if player[:weapon]
  player[:beers]         = player[:beers].clamp(0, 5)
  player[:cash ]         = player[:cash ].clamp(0, 5)
end

def cheat_menu(enemies, player, target)
  commands = [
    { code:  ",",  description: "#{player[:name]} 📒" },
    { code:  "n",  description: "#{player[:name]} #{WEAPON}" },
    { code:  "j",  description: "#{player[:name]} 🔪#{BROKE}" },
    { code:  "'",  description: "#{player[:name]} #{ITEM}"   },
    { code:  "x",  description: "#{player[:name]} -1 💵" },
    { code:  "c",  description: "#{player[:name]} +1 💵" },
    { code:  "f",  description: "#{player[:name]} -1 🍺" },
    { code:  "d",  description: "#{player[:name]} +1 🍺" },
    { code:  "v",  description: "#{player[:name]} +1 #{XP}" },
    { code:  "h",  description: "#{player[:name]} +1 🛠️" },
    { code:  "k",  description: "#{player[:name]} +10 💢 🎯 10" },
    { code:  ";",  description: "#{player[:name]} +100 #{player[:emoji]}" },
    { code:  "/",  description: "#{player[:name]} -50 #{player[:emoji]}" },
    { code:  ".",  description: "#{target[:name]} -20 #{target[:emoji]}" },
    { code:  "b",  description: "#{target[:name]} #{WEAPON}" },
    { code:  "]",  description: "#{target[:name]} #{ITEM}"   },
    { code:  "l",  description: "#{enemies.map { |enemy| enemy[:name] }.join(" ")} << 🙈 #{YL}Random#{CL}" },
    { code:  "m",  description: "#{enemies.map { |enemy| enemy[:name] }.join(" ")} 📒" },
  ]

  commands.each do |command|
    puts " " * 30 + "#{ML}[#{command[:code]}] #{command[:description]}#{CL}"
  end
  gets
  print `clear`
end

def print_player(player)
  player.each { |key, value| puts  " " * 30 + "#{BL}#{key}:" + " " * (9 - key.length) + "#{value}#{CL}" unless [:screen, :tracks].include?(key) }
  gets
  print `clear`
end

def print_enemies(enemies)
  enemies.each do |enemy|
    enemy.each do |key, value|
      puts  " " * 30 + "#{YL}#{key}:" + " " * (9 - key.length) + "#{value}#{CL}"
    end
    puts BARRIER
  end
  gets
  print `clear`
end
