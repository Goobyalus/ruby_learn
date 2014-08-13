
=begin
SUM  -> PROD + SUM
      | PROD
PROD -> DIGIT + PROD
      | DIGIT
NUM  -> /(\A(\d+(\.\d*)?)|(\.\d+))/	#numbers [regex can be improved]
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

def parse_num(str)
	if str =~ /(\A(\d+(\.\d*)?)|(\.\d+))/
		str[0...$1.length] = ''		#remove matched number from str
		return $1.to_f
	end
	raise "No number to parse in parse_num"
end

def parse_prod(str)

	#print "parse_prod called on #{str}\n"

	digit = parse_num(str)
	
	begin
		a = parse_wchar(str, "*/")
	rescue
		return digit
	end
	
	case a
	when '*' then op = :PROD
	when '/' then op = :DIV
	end
	
	return {:op=>op, :lo=>digit, :ro=>parse_prod(str)}
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
	
	return {:op=>op, :lo=>prod, :ro=>parse_sum(str)}
end

def eval(root)
	#print "calling eval on #{root}"

	if not root.is_a?(Hash) then return root end
	lo = root[:lo]
	ro = root[:ro]
	
	case root[:op]
	when nil then raise "No operator"
	when :SUM then return eval(lo) + eval(ro)
	when :SUB then return eval(lo) - eval(ro)
	when :PROD then return eval(lo) * eval(ro)
	when :DIV then return eval(lo) / eval(ro)
	else raise "unsupported operator"
	end
end

test_str = "1.1+.2*3-444/55.55+.6666-.0"
print "\n\ntest_str is: #{test_str}\n\n"
parse_tree = parse_sum(test_str)
print "parsing result is: #{parse_tree}\n\n"
print "eval result is: #{eval(parse_tree)}\n\n"


#TODO: robust - sign
#TODO: use better regex based on /\A[-+]?[0-9]*\.?[0-9]+\Z/
