# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# INTRO MESSAGES

def intro(player)
  enemy_intro = [
    "You got well pissed 🍷 and ended up in some 🏰 castle, #{player[:tracking][:name]} jumps from the ceiling! 💬 You goon get it now boy!",
    "You got caught ganking 🍻 hooch from the 🏡 package store. The 🏇👷🏼 townsfolk set the #{player[:tracking][:name]} on you!",
    "#{player[:tracking][:name]} busted through the 🚪 door, they're stark raving mad. They're out for 🔪 blood!",
  ]
  player_intro = [
    "You pull out your trusty katana from your trench coat and tip your fedora. #{player[:name]} 💬 The only thing sharper than my katana is my wit m'lady",
    "#{player[:name]} ✨ teleports behind #{player[:tracking][:name]}. #{player[:name]} 💬 Nothing personnel, kid",
    "There's like, stuff, everywhere, better get that. 💬 We won't get got, we gone get!",
  ]

  puts text_break([enemy_intro.sample, player_intro.sample].join(' '), " ", 65)
end

# END OF GAME MESSAGES

def game_over(player)
  win = [
    "You blasted #{player[:tracking][:name]} to another dimension. Your power level has increased.",
    "#{player[:tracking][:name]} had a sudden heart attack, you win by default.",
    "You splatted #{player[:tracking][:name]} like a grape.",
  ]
  lose = [
    "You stacked it and fell on a spike. #{player[:tracking][:name]} laughs at your misfortune.",
    "#{player[:tracking][:name]} ripped your head off. You won't be coming home for dinner.",
    "You Died! #{player[:tracking][:name]} shall feast on your entrails.",
  ]

  puts text_break((player[:hp].positive? ? win : lose).sample, " ", 80)
  puts BARRIER
  player[:hp].positive? ? win_art : lose_art
  puts BARRIER
  play_again
end

# Greeting to various methods

def greeting(place)
  enemy = [
    "Strike first, strike hard, no mercy",
    "Step on up and show who's the boss",
    "Will you get got, or you gone get?",
    "Time for a thrashing",
    "Lay down the law",
  ]
  shop = [
    "🧞💬 山🝗㇄⼕ㄖ爪🝗 丂〸尺闩𝓝Ꮆ🝗尺...",
  ]

  x, messages = place == :combat ? [75, enemy] : [70, shop]
  puts text_break(messages.sample, " ", x)
end

# When exploring rooms

def enter_room(room)
  messages = [
    "💭 Think I smelled some nosh 🍔 in #{room[:name]}, better check that.",
    "💭 Got a good feeling about #{room[:name]}, let's 'ave a butcher's!",
    "💭 Oi, this #{room[:name]} looks like a proper gaff, doesn't it?",
    "💭 I reckon #{room[:name]} might 'ave a hidden treasure or two!",
    "💭 Need a slash so bad! Bugger it, #{room[:name]} will do.",
    "💭 They won't find me in #{room[:name]}, I'm golden 🥇",
    "💭 #{room[:name]} seems like most logical choice.",
    "💭 In we go to #{room[:name]}, let's 'ave it!",
    "💭 #{room[:name]} is the place to be, mate!",
  ]

  puts text_break(messages.sample, " ", 80)
end
