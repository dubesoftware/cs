def cal_points(operations)
  record = []

  operations.each do |o|
    case o
    when /\d+/
      record << o.to_i
    when '+'
      if record.count >= 2
        record << record.last + record[record.count - 2]
      end
    when 'D'
      record << record.last * 2 if record.last
    when 'C'
      record.pop
    end
  end

  record.sum
end

p cal_points %w(5 2 C D +)
p cal_points %w(5 -2 4 C D 9 + +)
p cal_points %w(1 C)