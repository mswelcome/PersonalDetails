#Calculator function

def calc(op, num1, num2)
	num1 = num1.to_i
	num2 = num2.to_i

	if op == "add" 
		t = num1 + num2
	elsif op == "-"
		t = num1 - num2
	elsif op == "*"
		t = num1 * num2
	else op == "/"
		t = num1 / num2
	end
	t.to_s
end