
=begin
SUM  -> PROD + SUM
      | PROD
PROD -> DIGIT + PROD
      | DIGIT
DIGIT-> /[0-9]/
=end


def parse_wchar(str, chrs)
	#print "parse_wchar called on #{str}\n"
	if chrs.include? str[0]
		str[0]=''
		return str[0]
	end
	raise "No [#{chrs}] to parse in parse_wchar"
end

def parse_digit(str)
	#print "parse_digit called on #{str}\n"
	return parse_wchar(str, ('0'..'9').to_a)
end

def parse_prod(str)

	#print "parse_prod called on #{str}\n"

	digit = parse_digit(str)
	
	begin
		a = parse_wchar(str, "*/")
	rescue
		return digit
	end
	
	case a
	when '*' then op = :PROD
	when '/' then op = :DIV
	end
	
	return [op, digit, parse_prod(str)]
end

#print "#{parse_prod("1*2/3*5/1")}\n"

def parse_sum(str)
	
end

=begin
def parse_sum(str)
	prod = parse_prod(str)
end
=end
