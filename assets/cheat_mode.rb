# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# debug cheat menu for interface

def cheat_menu(player, enemies)
  case player[:choice]
  when 'j' then enemies.first[:hp] -= 40
  when 'k' then enemies << random_enemy
  when "n" then player[:hp]    -= 40
  when "m" then player[:hp]    += 100
  when "v" then player[:cash]  -= 1
  when "c" then player[:cash]  += 1
  when "f" then player[:drunk] -= 1
  when "d" then player[:drunk] += 1
  when "2" then player[:uses]  += 1 if player[:equipped]
  when "1" then player[:uses]  -= 1 if player[:equipped]
  when "0" then player[:uses]   = 0 if player[:equipped]
  when "w" then equip_weapon(player)
  when "e" then equip_weapon(enemies.sample)
  when "b" then weapon_breaks(player)
  when "g" then player.each { |key, value| puts text_break("#{YL}#{key}: #{value}#{CL}", " ", 80) unless [:land, :tracking].include?(key) }
  when "h" then enemies.each { |enemy| enemy.each { |key, value| puts text_break("#{YL}#{key}: #{value}#{CL}", " ", 80) } }
  end
  player[:uses] = player[:uses].clamp(0, 5) if player[:equipped]
  player[:drunk] = player[:drunk].clamp(0, 5)
  player[:cash] = player[:cash].clamp(0, 5)
end
