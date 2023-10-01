# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def beef_with_the_bouncer(player, the_boss, weapon, damage)

  total_damage = damage
  puts total_damage # DEBUG
  weapon[:durability] = [weapon[:durability] - 1, 0].max
  total_damage
end

def fight_the_bouncer(player, weapon, the_boss, boss_style, load_boss)

  user_choice = 0

  until (4..7).include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)
    fight_menu(player, boss_style, weapon)

    unarmed_damage = (player[:attack].sample * (100 - player[:drunk] * 5) / 100).to_i
    weapon_damage = ((player[:attack].sample + weapon[:attack].sample) * (100 - player[:drunk] * 5) / 100).to_i
    user_choice = gets.chomp.to_i

    case user_choice
    when 4
      print `clear`
      puts unarmed_damage # DEBUG
      puts weapon_damage # DEBUG
      total_damage = beef_with_the_bouncer(player, the_boss, weapon, (weapon[:durability].positive? ? weapon_damage : unarmed_damage))
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

  damage_info(the_boss, total_damage) unless user_choice == 6
  boss_style = the_boss[:style].sample
  return boss_style, weapon
end
