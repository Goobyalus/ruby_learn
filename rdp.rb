
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
		temp = str[0]
		str[0]=''
		return temp
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

def parse_sum(str)
	prod = parse_prod(str)
	
	begin
		a = parse_wchar(str, "+-")
	rescue
		return prod
	end
	
	case a
	when '+' then op = :SUM
	when '-' then op = :SUB
	end
	
	return [op, prod, parse_sum(str)]
end

print "#{parse_sum("1+2*3-4/5+6")}\n"
