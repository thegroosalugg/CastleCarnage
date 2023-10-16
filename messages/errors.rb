# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# ERROR MESSAGES

def error(reason)
  name = [
    "Just enter your name you plum",
  ]
  input = [
    "Just press the keys you melon",
  ]
  money = [
    "Bring money",
    "Bring more money",
  ]
  weapon_empty = [
    "Bring a proper weapon",
  ]
  weapon_full = [
    "You already got a weapon",
  ]
  wait = [
    "Once per turn, you melt!",
    "Uh-uh! I don't think so!",
    "Soz (but also no) ",
    "Don't get greedy! ",
    "Next round buddy!",
  ]
  denied = [
    "Just No ⛔",
    "Get Lost ⛔",
    "Out of Stock ⛔",
    "We Don't Have It ⛔",
    "You Can't Have That ⛔",
  ]

  error = [ # kill these. Keeping them for the lingo for now
    " Don't be a pillock ‼ ",
    " Don't be a plonker ‼ ",
    " Don't be a plank ‼ ",
    " Don't be a plum ‼ ",
    " Don't be a fool ‼ ",
    " Nobody likes a joker ‼ ",
    " Quit clowning around ‼ ",
    " Quit faffing around ‼ ",
    " Quit being a melon ‼ ",
  ]

  char, n, messages = case reason
  when :name   then [" ", 85, name]
  when :input  then [" ", 85, input]
  when :wait   then [" ", 85, wait]
  when :money  then [" ", 85, money]
  when :weapon_full  then [" ", 85, weapon_full]
  when :weapon_empty then [" ", 85, weapon_empty]
  when :denied then ["#{ML}#{ICONS.sample}#{CL}", 50, "#{ML}#{denied.sample}#{CL}"]
  end
  if reason == :denied
    padding_generator(messages, char, n)
  else
    print `clear`
    puts padding_generator([WRONG, messages.sample].join(" "), char, n)
  end
end
