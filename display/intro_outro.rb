# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def title_screen
  puts  "#{YL}#{CASTLE_CARNAGE}#{CL}"
  print "#{CN}#{CASTLE}#{CL}"
  puts  " " * 28 + NAME
end

def name_player(player) # Name your player
  name = ""
  while name.empty?
    title_screen
             name = gets.strip.slice(0, 8).downcase.capitalize
                x = name.length < 4 ? TITLES.sample : ""
    player[:name] = "#{GN}#{EMOJIS.sample} #{x}#{name}#{CL}"
    shout(player, :name)
  end
  print `clear`
end

def game_over(player) # game over message and art
  shout(player, :outro)
  puts BARRIER
  puts player[:hp].positive? ? "#{GN}#{GAME_WON}#{CL}" : "#{RD}#{GAME_OVER}#{CL}"
  puts BARRIER
  puts "#{YL}#{REPLAY}#{CL}"
end

def replay # unique error message art for continue screen
  print `clear`
  print "#{CN}#{BANNER}#{CL}"
  puts  "#{YL}#{REPLAY}#{CL}"
end
