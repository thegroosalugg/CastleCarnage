# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def beef_with_the_bouncer(player, weapon, the_boss, damage)
  case damage[:id]
  when :unarmed
    the_boss[:hp] -= damage[:value]
    shots_fired(player, the_boss, damage[:value], :hit)
  when :weapon
    if rand(weapon[:crit_ch]) == 1
      damage[:value] = (damage[:value] * rand(weapon[:crit_x])).to_i.clamp(0, 150)
      shots_fired(player, the_boss, damage[:value], :critical)
    elsif rand(weapon[:accuracy]) == 1
      damage[:value] = 0
      shots_fired(player, the_boss, :missed)
    else
      shots_fired(player, the_boss, damage[:value], :hit)
    end
    the_boss[:hp] -= damage[:value]
    weapon[:durability] = [weapon[:durability] - 1, 0].max
    weapon_speaks(weapon, :broke) if weapon[:durability].zero? && damage[:id] == :weapon
  end
end

def ranged_strike(player, weapon, the_boss, weapon_damage)
  damage = (weapon_damage[:value] * rand(2.0..2.5)).to_i.clamp(0, 200)
  the_boss[:hp] -= damage
  weapon[:durability] = 0
  shots_fired(player, the_boss, damage, :hit)
  weapon_speaks(weapon, :broke)
end

def armoury(player)
  weapon = rand(1..5) == 1 ? special_weapon : pick_weapon
  weapon_speaks(weapon, :got)
  player[:cash] -= 5
  weapon
end

def sneak_attack(player, the_boss, damage)
  player[:sneaky] = true
  chance = rand(1..2)
  if chance == 1
    cash = rand(3..7)
    player[:cash] = [player[:cash] + cash, 20].min
    the_boss[:hp] -= damage
    if rand(1..5) == 1
      life = (damage * rand(1.0..2.0)).to_i
      player[:hp] += life
      invoice(player, life, :life)
    end
    shots_fired(player, the_boss, damage, :hit)
    invoice(player, cash, :cash)
  else
    counter = (rand(the_boss[:attack]) * rand(0.6..0.8) - rand(player[:block])).to_i.clamp(0, 100)
    player[:hp] -= counter
    shots_fired(the_boss, player, counter, :counter)
  end
end

def fight_the_bouncer(player, weapon, the_boss, boss_style, load_boss)
  user_choice = 0
  player[:drunk] = (player[:drunk] + 1).clamp(0, 20)
  player[:sneaky] = false
  boss_walks(the_boss, boss_style, :intro)

  until (4..7).include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)
    fight_menu(player, boss_style, weapon)

    unarmed_damage = { id: :unarmed, value: (rand(player[:attack]) * (100 - player[:drunk] * 5) / 100).to_i }
    weapon_damage = { id: :weapon, value: ((rand(player[:attack]) + rand(weapon[:attack])) * (100 - player[:drunk] * 5) / 100).to_i }
    user_choice = gets.chomp.to_i

    case user_choice
    when 4
      print `clear`
      damage = weapon[:durability].positive? ? weapon_damage : unarmed_damage
      beef_with_the_bouncer(player, weapon, the_boss, damage)
    when 5
      print `clear`
      if weapon[:durability] > 2
        ranged_strike(player, weapon, the_boss, weapon_damage)
      else
        error_message
        redo
      end
    when 6
      print `clear`
      if weapon[:durability].zero? && player[:cash] > 4
        weapon = armoury(player)
        redo
      else
        error_message
        redo
      end
    when 7
      print `clear`
      damage = (unarmed_damage[:value] * rand(0.7..1.0)).to_i
      sneak_attack(player, the_boss, damage)
    else
      error_message
    end
  end

  boss_strikes_back(the_boss, boss_style, player, weapon) unless the_boss[:hp] <= 0 || user_choice == 5
  boss_style = the_boss[:style].sample
  boss_walks(the_boss, boss_style, :outro) if the_boss[:hp].positive?
  return boss_style, weapon
end
