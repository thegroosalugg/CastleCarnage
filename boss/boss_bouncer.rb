# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def fight_the_bouncer(player, weapon, the_boss, boss_style, load_boss)

  user_choice = 0

  until (4..7).include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)
    fight_menu(player, boss_style, weapon)

    unarmed_damage = (player[:attack].sample * (100 - player[:drunk] * 5) / 100).to_i
    weapon_damage = ((player[:attack].sample + weapon[:attack].sample) * (100 - player[:drunk] * 5) / 100).to_i
    user_choice = gets.chomp.to_i

    puts unarmed_damage
    puts weapon_damage

    case user_choice
    when 4
      print `clear`
      #total_damage = pay_the_tab(player, the_boss, damage) # Get total damage
    when 5
      print `clear`
      #total_damage = bar_fight(player, the_boss)
    when 6
      print `clear`
    when 7
      print `clear`
    else
      error_message
    end
  end

  #damage_info(the_boss, total_damage)
  boss_style = the_boss[:style].sample
  return boss_style, weapon
end
