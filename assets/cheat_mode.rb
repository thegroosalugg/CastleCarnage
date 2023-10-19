# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# debug cheat menu for interface

def cheat_menu(player, enemies)
  case player[:choice]
  when 'j' then enemies.first[:hp] -= 40
  when 'k' then enemies << random_enemy
  when "n" then player[:hp   ] -=  40
  when "m" then player[:hp   ] += 100
  when "v" then player[:cash ] -=   1
  when "c" then player[:cash ] +=   1
  when "f" then player[:drunk] -=   1
  when "d" then player[:drunk] +=   1
  when "i" then player[:kills] +=   1
  when "o" then player[:rooms] +=   1
  when "2" then player[:weapon][:uses ] +=   1 if player[:weapon]
  when "1" then player[:weapon][:uses ] -=   1 if player[:weapon]
  when "0" then player[:weapon][:uses ]  =   0 if player[:weapon]
  when "b" then weapon_breaks(player)
  when "w" then  equip_weapon(player)
  when "e" then  equip_weapon(enemies.sample)
  when "g" then  player.each { |key, value| puts text_break("#{YL}#{key}: #{value}#{CL}", " ", 80) unless [:land, :tracking].include?(key) }
  when "h" then enemies.each { |enemy| enemy.each { |key, value| puts text_break("#{YL}#{key}: #{value}#{CL}", " ", 80) } }
  end
  player[:weapon][:uses ] = player[:weapon][:uses ].clamp(0, 5) if player[:weapon]
  player[:drunk] = player[:drunk].clamp(0, 5)
  player[:cash ] = player[:cash ].clamp(0, 5)
end
