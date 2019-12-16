

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

def update_all_coordinates(current_position, new_position, all_coordinates, easter_bunny_found, easter_bunny_location)
    x_position_diff = new_position[0] - current_position[0]
    y_position_diff = new_position[1] - current_position[1]
    x_position = current_position[0]
    y_position = current_position[1]
        if (x_position_diff == 0 && y_position_diff > 0)
            (y_position_diff).times do
                y_position = y_position + 1
                if all_coordinates.include? [x_position, y_position]
                    puts "Easter bunny is at #{x_position} , #{y_position}"
                    easter_bunny_found = true
                    easter_bunny_location = [x_position, y_position]
                end
                all_coordinates.push([x_position, y_position])
            end
        elsif (x_position_diff == 0 && y_position_diff < 0)
            (y_position_diff.abs).times do
                y_position = y_position - 1
                if all_coordinates.include? [x_position, y_position]
                    puts "Easter bunny is at #{x_position} , #{y_position}"
                    easter_bunny_found = true
                    easter_bunny_location = [x_position, y_position]
                end
                all_coordinates.push([x_position, y_position])
            end
        elsif (y_position_diff == 0 && x_position_diff > 0)
            (x_position_diff).times do
                x_position = x_position + 1
                if all_coordinates.include? [x_position, y_position]
                    puts "Easter bunny is at #{x_position} , #{y_position}"
                    easter_bunny_found = true
                    easter_bunny_location = [x_position, y_position]
                end
                all_coordinates.push([x_position, y_position])
            end
        else
            (x_position_diff.abs).times do
                x_position = x_position - 1
                if all_coordinates.include? [x_position, y_position]
                    puts "Easter bunny is at #{x_position} , #{y_position}"
                    easter_bunny_found = true
                    easter_bunny_location = [x_position, y_position]
                end
                all_coordinates.push([x_position, y_position])
            end
        end
        easter_bunny_found



    #puts "Printing all #{all_coordinates}"
end

def get_info
    puts "enter the directions"
    input = gets.chomp
    # input.split
    current_direction = "N"
    x_position = 0
    y_position = 0
    array =[]
    current_position = [0,0]
    new_position = [0,0]
    all_coordinates = [[0,0]]
    easter_bunny_found = false
    easter_bunny_location = []

    input.split.each { |a| array.push(a.sub(",",""))}
    #puts "array is #{array}"
    for i in array do
        left_or_right = i.tr("0-9", "")
        distance = i.delete('^0-9').to_i
        
        new_direction = get_new_directon(left_or_right, current_direction)
        current_direction = new_direction
        current_position = new_position
        new_position = calculate_distance(new_direction, distance.to_i, x_position, y_position)
        x_position = new_position[0]
        y_position = new_position[1]
        easter_bunny_found = update_all_coordinates(current_position, new_position, all_coordinates, easter_bunny_found, easter_bunny_location)
        puts easter_bunny_location

        if easter_bunny_found == true
            puts "Easter bunny is @ #{easter_bunny_location}"
            break
        end

    end
    puts "Distance = #{x_position.abs + y_position.abs}"

end
get_info