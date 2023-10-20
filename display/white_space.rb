# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Whitespace generator so display stays in same place regardless of name length

def whitespace(entity, char, size)
  char * [0, size - entity[:name].gsub(/\e\[[0-9;]*m/, "").length].max
end

# Padding Generator

def padding_generator(message, char, size)
  padding = char * [1, (size - message.length) / 2].max
  "#{padding} #{message} #{padding}"
end

# text break methods to align all messages

def text_break(message, char, size)
  lines = []
  current_line = ""
  current_length = 0

  message.split.each do |word|
    word_with_ansi = word.gsub(/\e\[[0-9;]*m/, "")  # Remove ANSI escape codes for length calculations
    word_length = word_with_ansi.length

    if current_length + word_length + 1 > size
      lines << padding_generator(current_line, char, size)
      current_line = ""
      current_length = 0
    end

    current_line += " " if current_length > 0
    current_line += word
    current_length += word_length
  end

  lines << padding_generator(current_line, char, size) unless current_line.empty?
  lines
end
