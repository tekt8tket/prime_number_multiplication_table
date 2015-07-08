class Jibe::MultiplicationTable

  HEADER_TEXT = 'Prime Number Multiplication Table'

  def self.print(list)
    table = new(list)
    table.print
  end

  attr_accessor :list, :last_line_widths, :divider

  def initialize(list)
    self.list = list
    calculate_last_line_widths
    make_divider
  end

  def print
    print_header
    print_first_line

    list.length.times do |row_num|
      print_row(row_num)
      print_divider
    end
  end

private

  def calculate_last_line_widths
    # Add first column width to value widths
    self.last_line_widths = values_widths.unshift(list.last.to_s.length)
  end

  def values_widths
    list.map do |n|
      (n * list.last).to_s.length
    end
  end


  def make_divider
    self.divider ||= '+' + last_line_widths.inject('') {|divider, w| divider << divider_section_string(w)}
  end

  def divider_section_string(max_string_size)
    '--' + ('-' * max_string_size) + '+'
  end


  def print_header
    print_divider
    print_header_middle_row
    print_divider
  end

  def print_divider
    puts divider
  end

  def print_header_middle_row
    center_text = "#{HEADER_TEXT} (#{list.length} numbers)"
    shortfall_spaces = divider.length - center_text.length - 2
    if shortfall_spaces < 0
      # No room for header, omitting
      spaces = divider.length - 2
      puts "|#{' ' * spaces}|"
    else
      spaces, remainder = shortfall_spaces.divmod(2)
      puts "|#{' ' * spaces}#{center_text}#{' ' * (spaces + remainder)}|"
    end
  end

  def print_first_line
    line_array = [nil] + list

    puts make_line(line_array)

    print_divider
  end

  def print_row(row_num)
    # first element is the list[row_num]
    first_value = list[row_num]
    line_array = [first_value] + list.map{|n| n * first_value}
    puts make_line(line_array)
  end

  # '| 2  | 4  | 6  | 10 | 14 | 22 | 26 | 34 | 38 | 46 | 58  |'
  def make_line(line_array)
    column_num = 0
    line_array.inject('') do |line, item|
      line += line_item(item, last_line_widths[column_num])
      column_num += 1
      line
    end + '|'
  end

  # '| 13   '
  def line_item(n, width)
    if n.is_a?(Integer)
      format = "%-#{width + 1}d"
      "| #{sprintf(format, n.to_s)}"
    else
      "| #{' ' * (width + 1)}"
    end
  end

end