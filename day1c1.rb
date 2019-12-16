

def get_new_directon(left_or_right, current_direction)
    if current_direction == "N"
        if left_or_right == "L"
            new_direction = "W"
        else
            new_direction = "E"
        end
    elsif current_direction == "E"
        if left_or_right == "L"
            new_direction = "N"
        else
            new_direction = "S"
        end
    elsif current_direction == "W"
        if left_or_right == "L"
            new_direction = "S"
        else
            new_direction = "N"
        end
    elsif current_direction == "S"
        if left_or_right == "L"
            new_direction = "E"
        else
            new_direction = "W"
        end
    end
    new_direction
end

def calculate_distance(new_direction, distance, x_position, y_position)
    if new_direction == "E"
        x_position += distance
    elsif new_direction =="W"
        x_position -= distance
    elsif new_direction == "N"
        y_position += distance
    else
        y_position -= distance
    end
    return [x_position, y_position]
end

def get_info
    puts "enter the directions"
    input = gets.chomp
    # input.split
    current_direction = "N"
    x_position = 0
    y_position = 0
    array =[]
    position = []
    all_coordinates = [[0,0]]
    input.split.each { |a| array.push(a.sub(",",""))}
    puts "array is #{array}"
    for i in array do
        left_or_right = i.tr("0-9", "")
        distance = i.delete('^0-9').to_i
        
        new_direction = get_new_directon(left_or_right, current_direction)
        current_direction = new_direction
        position = calculate_distance(new_direction, distance.to_i, x_position, y_position)
        x_position = position[0]
        y_position = position[1]

    end
    puts "Distance = #{x_position.abs + y_position.abs}"

end
get_info