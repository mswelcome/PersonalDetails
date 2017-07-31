#Calculator

require "sinatra"
require_relative "calc.rb"

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
	t = calc(op, num1, num2)
		
	redirect '/res?fn=' + fn + '&ln=' + ln + '&num1=' + num1 + '&num2=' + num2 + '&op=' + op + '&t=' + t
end


get '/res' do
	fn = params[:fn]
	ln = params[:ln]
	num1 = params[:num1].to_s
	num2 = params[:num2].to_s
	op = params[:op]
	t = params[:t]
	if op == "add"
		op = "+"
	end
	erb :res, locals: {fn: fn, ln: ln, num1: num1, num2: num2, op: op, t: t}
end

post '/p_res' do
	fn = params[:fn]
	ln = params[:ln]
	redirect '/nums?fn=' + fn + '&ln=' + ln
end

