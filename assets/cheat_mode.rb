# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# debug cheat menu for interface

def cheat_mode(player, enemies)
  case player[:choice]
  when "l" then enemies << random_enemy
  when "." then enemies.first[:hp] -= 25
  when "/" then player[:hp   ] -=  50
  when ";" then player[:hp   ] += 100
  when "x" then player[:cash ] -=   1
  when "c" then player[:cash ] +=   1
  when "f" then player[:drunk] -=   1
  when "d" then player[:drunk] +=   1
  when "g" then player[:kills] +=   1
  when "v" then player[:rooms] +=   1
  when "h" then player[:weapon][:uses ] += 1 if player[:weapon]
  when "j" then weapon_breaks(player) if player[:weapon]
  when "n" then  equip_weapon(player)
  when "b" then  equip_weapon(enemies.sample)
  when "p" then    cheat_menu(enemies, player)
  when ","
    player.each { |key, value| puts  " " * 30 + "#{BL}#{key}:" + " " * (9 - key.length) + "#{value}#{CL}" unless [:land, :tracking].include?(key) }
    gets
    print `clear`
  when "m"
    enemies.each { |enemy| enemy.each { |key, value|
      puts  " " * 30 + "#{YL}#{key}:" + " " * (9 - key.length) + "#{value}#{CL}" }
      puts BARRIER }
    gets
    print `clear`
  end
  player[:weapon][:uses ] = player[:weapon][:uses ].clamp(0, 5) if player[:weapon]
  player[:drunk] = player[:drunk].clamp(0, 5)
  player[:cash ] = player[:cash ].clamp(0, 5)
end

def cheat_menu(enemies, player)
  commands = [
    { code: ',', description: "#{player[:name]} 📒" },
    { code: 'n', description: "#{player[:name]} #{WEAPON}" },
    { code: 'j', description: "#{player[:name]} 🔪#{BROKE}" },
    { code: 'x', description: "#{player[:name]} -1💵" },
    { code: 'c', description: "#{player[:name]} +1💵" },
    { code: 'f', description: "#{player[:name]} -1🍺" },
    { code: 'd', description: "#{player[:name]} +1🍺" },
    { code: 'g', description: "#{player[:name]} +1💀" },
    { code: 'v', description: "#{player[:name]} +1🏰" },
    { code: 'h', description: "#{player[:name]} +1🛠️" },
    { code: ';', description: "#{player[:name]} +100#{player[:emoji]}" },
    { code: '/', description: "#{player[:name]} -50#{player[:emoji]}" },
    { code: '.', description: "#{enemies.first[:name]} -25#{enemies.first[:emoji]}" },
    { code: 'b', description: "#{enemies.first[:name]} #{WEAPON}" },
    { code: 'l', description: "#{enemies.map { |enemy| enemy[:name] }.join(' ')} << 🙈 #{YL}Random#{CL}" },
    { code: 'm', description: "#{enemies.map { |enemy| enemy[:name] }.join(' ')} 📒" },
  ]

  commands.each do |command|
    puts " " * 30 + "#{ML}[#{command[:code]}] #{command[:description]}#{CL}"
  end
  gets
  print `clear`
end
