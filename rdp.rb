
=begin
SUM  -> PROD + SUM
      | PROD
PROD -> DIGIT + PROD
      | DIGIT
DIGIT-> /[0-9]/
=end


def parse_wchar(str, chrs)
	if chrs.include? str[0]
		return [str[0], str[1...str.length]]
	end
	raise "No [#{chrs}] to parse in parse_wchar"
end

def parse_digit(str)
	return parse_wchar(str, ('0'..'9').to_a)
end

def parse_prod(str)
	digit = parse_digit(str)
	
	begin
		a, str = parse_wchar(str, "*/")
	rescue
		return digit
	end
	
	case a
	when '*' then op = :PROD
	when '/' then op = :DIV
	end
	
	return [op, digit, parse_prod(str)]
end


print parse_prod("1*2")
