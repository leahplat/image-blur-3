class Image

  def initialize (number)
    @number = number
  end

  def get_ones
    ones = []
    @number.each_with_index do |row, row_type|
      row.each_with_index do |item, col_type|
        if item == 1
          ones << [row_type, col_type]
        end
      end
    end
    ones
  end

  def blur!(blur_distance)
    ones = get_ones

    @number.each_with_index do |row, row_type|
      row.each_with_index do |item, col_type|
        ones.each do |found_row_type, found_col_type|
          if manhattan_distance(col_type, row_type, found_col_type, found_row_type) <= blur_distance
            @number[row_type][col_type] = 1
          end
        end
      end
    end
  end

  def manhattan_distance (x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
  
    horizontal_distance + vertical_distance
  end

  def output_image
    @number.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 1, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 1]
])


image.output_image
puts


image.blur!(2)
image.output_image
