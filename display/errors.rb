# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# ERROR MESSAGES

def error_message
  messages = [
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

  print `clear`
  puts SEPARATOR
  puts padding_generator(messages.sample, "❌", 50)
end

def denied
  messages = [
    "Just No ⛔",
    "Get Lost ⛔",
    "Out of Stock ⛔",
    "We Don't Have It ⛔",
    "You Can't Have That ⛔",
  ]

  padding_generator(messages.sample, "-", 50)
end

def drained
  messages = [
    " You had your chance, go fight now ‼ ",
    " Once per turn, you melt ‼ ",
    " Uh-uh! I don't think so ‼ ",
    " You've given nuff blood ‼ ",
    " Soz (but also no) ‼ ",
    " Don't get greedy ‼ ",
    " Next round buddy ‼ ",
  ]

  print `clear`
  puts SEPARATOR
  puts padding_generator(messages.sample, "🩸", 52)
end
