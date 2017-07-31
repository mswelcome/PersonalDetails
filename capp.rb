#Extended PersonalDetails

require "sinatra"
require_relative "/minedminds/github/numbers/add.rb"
require_relative "/minedminds/github/subtraction/sub.rb"
require_relative "/minedminds/github/multiply/mul.rb"
require_relative "/minedminds/github/division/div.rb"



get '/' do
	msg = params[:msg] || ""
	erb :login, locals: {msg: msg}

end

def login(un, pw)
	users = {admin: "admin", msw: "msw", guest: "guest"}
	pass = {a: "admin", m: "qwerty", g: "guest"}
	
	if users.has_value?(un) && pass.has_value?(pw) 
  		redirect '/user'
  	else
  		redirect '/?msg=Incorrect username or password' 
  	end
end 

post '/p_login' do	
	un = params[:un]
	pw = params[:pw]
	login(un, pw)
end 

get '/user' do
	yay = "Yay!!! Sucessful Login!"
	erb :un, locals: {yay: yay}
	
end

post '/un' do
	fn = params[:fn]
	ln = params[:ln]
	redirect '/nums?fn=' + fn + '&ln=' + ln
end

get '/nums' do
	fn = params[:fn]
	ln = params[:ln]
	erb :nums, locals: {fn: fn, ln: ln}
end

post '/p_nums' do
	fn = params[:fn]
	ln = params[:ln]
	num1 = params[:num1]
	num2 = params[:num2]
	op = params[:op]

	if op == "+" 
		t = add(num1, num2)
	elsif op == "-"
		t = sub(num1, num2)
	elsif op == "*"
		t = mul(num1, num2)
	else op == "/"
		t = div(num1, num2)
	end
	redirect '/res?fn=' + fn + '&ln=' + ln + '&num1=' + num1 + '&num2=' + num2 + '&op=' + op + '&t=' + t
end

get '/res' do
	fn = params[:fn]
	ln = params[:ln]
	num1 = params[:num1].to_s
	num2 = params[:num2].to_s
	op = params[:op]
	t = params[:t].to_s
	#z = params[:z] || ""
	erb :res, locals: {fn: fn, ln: ln, num1: num1, num2: num2, op: op, t: t}
end

post '/p_res' do
	fn = params[:fn]
	ln = params[:ln]
	redirect '/nums?fn=' + fn + '&ln=' + ln
end

