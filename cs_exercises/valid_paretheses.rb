def is_valid(s)
  chars = %w( ( ) { } [ ] )
  contains_char = nil

  chars.each do |c|
    if s.include?(c)
      contains_char = true if !(contains_char)
    end
  end

  if chars.filter { |c| chars.find_index(c).odd? }.include?(s.chars.first) ||
      !(contains_char) ||
      s.size < 2 ||
      s.size > 104
    return false
  end
    
  stack = []
  expected = []
  counter = 0

  s.each_char do |c|
    case c
    when '('
      stack << c
      expected << ')'
      counter += 1
    when ')'
      if expected.last == ')'
        stack.pop
        expected.pop
        counter -= 1
      end
    when '{'
      stack << c
      expected << '}'
      counter += 1
    when '}'
      if expected.last == '}'
        stack.pop
        expected.pop
        counter -= 1
      end
    when '['
      stack << c
      expected << ']'
      counter += 1
    when ']'
      if expected.last == ']'
        stack.pop
        expected.pop
        counter -= 1
      end
    end
  end

  counter == 0
end
  
p is_valid '()'
p is_valid '()[]{}'
p is_valid '(]'
p is_valid '([)]'
p is_valid '{[]}'
p is_valid ')([]{}'