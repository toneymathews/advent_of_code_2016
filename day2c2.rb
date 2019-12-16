require 'byebug'

def get_position(code, directions)
  case code
  when '2','3','4'
    x_pos = code.to_i - 3
    y_pos = 1
  when '5','6','7','8','9'
    y_pos = 0
    x_pos = code.to_i - 7
  when '1'
    y_pos = 2
    x_pos = 0
  when 'A','B','C'
    y_pos = -1
    x_pos = code.ord - 66
  when 'D'
    y_pos = -2
    x_pos = 0
  end
  directions.chars.each do |dir|
    case dir
    when "U"
      case x_pos
      when -2, 2
        y_pos = 0
      when -1, 1
        y_pos = (y = y_pos + 1) > 1 ? 1 : y
      when 0
        y_pos = (y = y_pos + 1) > 2 ? 2 : y
      end
    when "D"
      case x_pos
      when -2, 2
        y_pos = 0
      when -1, 1
        y_pos = (y = y_pos - 1) < -1 ? -1 : y
      when 0
        y_pos = (y = y_pos - 1) < -2 ? -2 : y
      end
    when "L"
      case y_pos
      when -2, 2
        x_pos = 0
      when -1, 1
        x_pos = (x = x_pos - 1) < -1 ? -1 : x
      when 0
        x_pos = (x = x_pos - 1) < -2 ? -2 : x
      end
    when "R"
      case y_pos
      when -2, 2
        x_pos = 0
      when -1, 1
        x_pos = (x = x_pos + 1) > 1 ? 1 : x
      when 0
        x_pos = (x = x_pos + 1) > 2 ? 2 : x
      end
    end
  end
  case y_pos
  when -1
    (66 + x_pos).chr
  when -2
    'D'
  when 0
    (x_pos + 7).to_s
  when 1
    (x_pos + 3).to_s
  when 2
    '1'
  end
end


def get_input
  result = ['5']
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


