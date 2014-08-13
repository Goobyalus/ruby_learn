
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
	raise "No [#{chrs}] to parse in parse_wchar"
end

def parse_digit(str)
	return parse_wchar(str, range('0'..'9'))
end

def parse_prod(str)
	digit = parse_digit(str)
	
end
