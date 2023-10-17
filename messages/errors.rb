# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# ERROR MESSAGES

def error(reason)
  name = [
    "Just enter your name you plum",
  ]
  input = [
    "Don't be a pillock! ",
    "Don't be a plonker! ",
    "Don't be a plank! ",
    "Don't be a plum! ",
    "Don't be a fool! ",
    "Nobody likes a joker! ",
    "Quit clowning around! ",
    "Quit faffing around! ",
    "Quit being a melon! ",
      ]
  denied = [
    "Just No ⛔",
    "Get Lost ⛔",
    "Out of Stock ⛔",
    "We Don't Have It ⛔",
    "You Can't Have That ⛔",
  ]

  char, n, messages = case reason
  when :name   then [" ", 85, name]
  when :input  then [" ", 85, input]
  when :denied then ["#{ML}#{ICONS.sample}#{CL}", 50, "#{ML}#{denied.sample}#{CL}"]
  end
  if reason == :denied
    padding_generator(messages, char, n)
  else
    print `clear`
    puts padding_generator([WRONG, messages.sample].join(" "), char, n)
  end
end
