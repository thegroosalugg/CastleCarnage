# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def pop_a_hydrant(player, the_boss, boss_type)
  print `clear`

  case boss_type
  when :fire
    multiplier = rand(1.5..2.5)
  when :electric
    multiplier = rand(1.0..1.4)
  when :water
    multiplier = rand(0.4..0.8)
  else
    multiplier = 1.0
  end

  damage = [(40..70).to_a.sample - the_boss[:block].sample, 1].max * multiplier

  the_boss[:hp] -= damage
  player[:hp] -= damage if boss_type == :electric
  damage_info(the_boss, boss_type, damage, multiplier)
end

def pay_with_blood(player)
  print `clear`
  player[:hp] -= (20..50).to_a.sample
  player[:block] = player[:block].map { |block| block + 1 }
end

def big_boss_battle(player)
  print `clear`
  load_boss = big_boss_art
  the_boss = {
    hp: rand(500..600), attack: (10..100).to_a, block: (3..20).to_a, crit_ch: (1..9).to_a, crit_x: -> { rand(1.5..3.0) }, accuracy: (1..8).to_a,
    type: [:fire, :water, :electric, :ice]
  }
  boss_type = nil
  game_info(player, the_boss, boss_type)

  while the_boss[:hp].positive? && player[:hp].positive?
    puts load_boss
    boss_menu

    user_decision = gets.chomp.to_i
    boss_type = the_boss[:type].sample if (4..6).include?(user_decision)

    case user_decision
    when 4
      pop_a_hydrant(player, the_boss, boss_type)
    when 5
      pay_with_blood(player)
    when 6
      break
    else
      error_message
    end

    game_info(player, the_boss, boss_type)
  end
end
