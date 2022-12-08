def is_valid(s)
  chars = ['(', ')', '{', '}', '[', ']']
  contains_char = nil

  chars.each do |c|
    if s.include?(c)
      contains_char = true if !(contains_char)
    end
  end

  if !(contains_char) || s.size < 2 || s.size > 104
    return false
  end
    
  stack = []
  expected = []
  counter = 0

  s.each_char do |c|    
    case c
    when '('
      stack << c
      counter += 1
      expected << ')'
    when ')'
      if expected.last == ')'
        stack.pop
        counter -= 1
        expected.pop
      end
    when '{'
      stack << c
      counter += 1
      expected << '}'
    when '}'
      if expected.last == '}'
        stack.pop
        counter -= 1
        expected.pop
      end
    when '['
      stack << c
      counter += 1
      expected << ']'
    when ']'
      if expected.last == ']'
        stack.pop
        counter -= 1
        expected.pop
      end
    end
  end

  counter == 0
end
  
# p is_valid("ateststring")
# p is_valid("(){}[]")
# p is_valid("({[]})")
# p is_valid("({[abcscsc]})")
# p is_valid("({[abcscsc)}]")
# p is_valid("){[abcscsc)}]")
# p is_valid("(fvf{fdvf[abcscsc)sc}c]")
# p is_valid("(fvf{fdvf[abcscsc]sc}c)")
# p is_valid("(")
# p is_valid("{}")