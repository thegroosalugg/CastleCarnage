# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def pop_a_hydrant(player, the_boss)
  print `clear`

  boss_type = the_boss[:type].sample

  case boss_type
  when :fire
    damage_multiplier = 1.5
  when :electric
    damage_multiplier = 1.2
  when :water
    damage_multiplier = 0.6
  else
    damage_multiplier = 1.0
  end

  damage = [(40..70).to_a.sample - the_boss[:block].sample, 1].max * damage_multiplier

  puts "[DEBUG] damage: #{damage} multiplier #{damage_multiplier} || Boss type #{boss_type}"

  the_boss[:hp] -= damage
  player[:hp] -= damage if boss_type == :electric
end


def big_boss_battle(player)
  load_boss = big_boss_art
  the_boss = {
    hp: rand(500..600), attack: (10..100).to_a, block: (3..20).to_a, crit_ch: (1..9).to_a, crit_x: -> { rand(1.5..3.0) }, accuracy: (1..8).to_a,
    type: [:fire, :water, :electric, :ice]
  }

  while the_boss[:hp].positive? && player[:hp].positive?
    #print `clear`
    puts load_boss
    boss_menu

    puts "[DEBUG} BOSS: #{the_boss[:hp].to_i} || YOU: #{player[:hp].to_i} BLOCK: #{player[:block].sample} TYPE #{the_boss[:type].sample}"

    user_decision = gets.chomp.to_i

    case user_decision
    when 4
      pop_a_hydrant(player, the_boss)
    when 5
      break
    else
      error_message
    end

  end
end
