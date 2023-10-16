# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# ERROR MESSAGES

def error_message(reason)
  error = [
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
  drained = [
    " You had your chance, go fight now ‼ ",
    " Once per turn, you melt ‼ ",
    " Uh-uh! I don't think so ‼ ",
    " You've given nuff blood ‼ ",
    " Soz (but also no) ‼ ",
    " Don't get greedy ‼ ",
    " Next round buddy ‼ ",
  ]
  denied = [
    "Just No ⛔",
    "Get Lost ⛔",
    "Out of Stock ⛔",
    "We Don't Have It ⛔",
    "You Can't Have That ⛔",
  ]

  char, n, messages = case reason
  when :error  then [" ", 70, error]
  when :drain  then [" ", 70, drained]
  when :denied then ["#{ML}#{ICONS.sample}#{CL}", 50, "#{ML}#{denied.sample}#{CL}"]
  end
  if reason == :denied
    padding_generator(messages, char, n)
  else
    print `clear`
    puts padding_generator("#{RD}#{messages.sample}#{CL}", char, n)
  end
end
