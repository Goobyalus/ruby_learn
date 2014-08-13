
print "asdasd\n"


def bigsmall(target, big, small)
	
	if target == 0 then return true end
	
	b = false
	s = false
	
	if big > 0
		b =  bigsmall(target-5, big-1, small)
	end
	
	if small > 0
		s = bigsmall(target-1, big, small-1)
	end
	
	return (b or s)
end

print bigsmall(5, 0, 0)
print "\n"
print bigsmall(5, 1, 0)
print "\n"
print bigsmall(5, 2, 0)
print "\n"
print bigsmall(5, 0, 1)
print "\n"
print bigsmall(5, 0, 5)
print "\n"
print bigsmall(5, 0, 6)
print "\n"
print bigsmall(4, 1, 1)
print "\n"



'''
def change(amt,  dollars, halves, quarters, dimes, nickels, pennies){
	if(amt < 0)
		return false
	end
	
	if(amt == 0)
		return true
	end
	
	#forgot to && with x > 0
	return change(amt -1, dollars-1, halves, quarters, dimes, nickels, pennies) or
			change(amt-.5, dollars, halves-1, quarters, dimes, nickels, pennies) or
			change(amt-.25, dollars, halves, quarters-1, dimes, nickels, pennies) or
			change(amt-.1, dollars, halves, quarters, dimes-1, nickels, pennies) or
			change(amt-.05, dollars, halves, quarters, dimes, nickels-1, pennies) or
			change(amt-.01, dollars, halves, quarters, dimes, nickels, pennies-1)
end

print "...."
print change(1, 1, 1, 1, 1, 1, 1)
print change(1.01, 1, 1, 1, 1, 1, 1)
print change(1.07, 1, 1, 1, 1, 1, 1)
'''
