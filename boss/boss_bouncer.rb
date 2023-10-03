# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def beef_with_the_bouncer(player, weapon, the_boss, damage)
  case damage[:id]
  when :unarmed
    the_boss[:hp] -= damage[:value]
    succesful_hit(player, the_boss, damage[:value])
  when :weapon
    if weapon[:crit_ch].sample == 1
      damage[:value] = (damage[:value] * weapon[:crit_x].call).to_i.clamp(0, 150)
      critical_hit(player, the_boss, damage[:value])
    elsif weapon[:accuracy].sample == 1
      damage[:value] = 0
      missed(player, the_boss)
    else
      succesful_hit(player, the_boss, damage[:value])
    end
    the_boss[:hp] -= damage[:value]
    weapon[:durability] = [weapon[:durability] - 1, 0].max
    weapon_broke(weapon) if weapon[:durability].zero? && damage[:id] == :weapon
  end
end

def ranged_strike(player, weapon, the_boss, weapon_damage)
  damage = (weapon_damage[:value] * rand(2.0..2.5)).to_i.clamp(0, 200)
  the_boss[:hp] -= damage
  weapon[:durability] = 0
  succesful_hit(player, the_boss, damage)
  weapon_broke(weapon)
end

def armoury(player)
  weapon = rand(1..5) == 1 ? special_weapon : pick_weapon
  got_weapon(weapon)
  player[:cash] -= 5
  weapon
end

def sneak_attack(player, the_boss, damage)
  chance = rand(1..2)
  if chance == 1
    cash = rand(3..6)
    player[:cash] = [player[:cash] + cash, 20].min
    the_boss[:hp] -= damage
    if rand(1..5) == 1
      life = (damage * rand(1.0..2.0)).to_i
      player[:hp] += life
      invoice(player, life, :life)
    end
    succesful_hit(player, the_boss, damage)
    invoice(player, cash, :cash)
  else
    counter_attack = (the_boss[:attack].sample * rand(0.6..0.8) - player[:block].sample).to_i.clamp(0, 100)
    player[:hp] -= counter_attack
    counter(player, the_boss, counter_attack)
  end
end

def fight_the_bouncer(player, weapon, the_boss, boss_style, load_boss)
  user_choice = 0
  player[:drunk] = (player[:drunk] + 1).clamp(0, 20)
  style_intro(the_boss, boss_style)

  until (4..7).include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)
    fight_menu(player, boss_style, weapon)

    unarmed_damage = { id: :unarmed, value: (player[:attack].sample * (100 - player[:drunk] * 5) / 100).to_i }
    weapon_damage = { id: :weapon, value: ((player[:attack].sample + weapon[:attack].sample) * (100 - player[:drunk] * 5) / 100).to_i }
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
      damage = (unarmed_damage[:value] * rand(0.6..1.0)).to_i
      sneak_attack(player, the_boss, damage)
    else
      error_message
    end
  end

  boss_strikes_back(the_boss, boss_style, player, weapon)
  boss_style = the_boss[:style].sample
  style_outro(the_boss, boss_style)
  return boss_style, weapon
end
