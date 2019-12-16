require 'byebug'

def get_position(code, directions)
  y_pos = (code - 1) / 3
  x_pos = (code - 1) % 3# 1:x+y+1 4:3x+y+1
  directions.chars.each do |dir|
    case dir
    when "U"
      y_pos = (y = y_pos - 1) < 0 ? 0 : y
    when "D"
      y_pos = (y = y_pos + 1) > 2 ? 2 : y
    when "L"
      x_pos = (x = x_pos - 1) < 0 ? 0 : x
    when "R"
      x_pos = (x = x_pos + 1) > 2 ? 2 : x
    end
  end
  ((y_pos * 3) + x_pos + 1)
end


def get_input
  result = [5]
  puts "enter the directions"
  input = gets("\t\n").chomp
  all_directions =  input.split
  n =  all_directions.size
  i = 0
  n.times do
    result.push(get_position(result.last, all_directions[i]))
    i = i + 1
  end
  result.delete_at(0)
  puts result
end

get_input
