#Extended PersonalDetails

require "sinatra"




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
	erb :un
	
end

post '/un' do
	fn = params[:fn]
	ln = params[:ln]
	redirect 'age?fn=' + fn + '&ln=' + ln
end

get '/age' do 
	fn = params[:fn]
	ln = params[:ln]
	erb	:age, locals: {fn: fn, ln: ln}
end

post '/p_age' do
	fn = params[:fn]
	ln = params[:ln]
	age = params[:age]
	redirect 'hair?fn=' + fn + '&ln=' + ln + '&age=' + age
end

get '/hair' do
	fn = params[:fn]
	ln = params[:ln]
	age = params[:age]
	erb :hair, locals: {fn: fn, ln: ln, age: age}
end

post '/p_hair' do 
	fn = params[:fn]
	ln = params[:ln]
	age = params[:age]
	hair = params[:hair]
	redirect 'eye?fn=' + fn + '&ln=' + ln + '&age=' + age + '&hair=' + hair
end 

get '/eye' do
	fn = params[:fn]
	ln = params[:ln]
	age = params[:age]
	hair = params[:hair]
	erb :eye, locals: {fn: fn, ln: ln, age: age, hair: hair}
end

post '/p_eye' do
	fn = params[:fn]
	ln = params[:ln]
	age = params[:age]
	hair = params[:hair]
	eye = params[:eye]
	#{}"#{fn} #{ln}, #{age}, #{hair}, #{eye}"
	redirect 'food?fn=' + fn + '&ln=' + ln + '&age=' + age + '&hair=' + hair + '&eye=' + eye 
end

get '/food' do
	fn = params[:fn]
	ln = params[:ln]
	age = params[:age]
	hair = params[:hair]
	eye = params[:eye]	
	erb :food, locals: {fn: fn, ln: ln, age: age, hair: hair, eye: eye}
end

post '/p_food' do
	fn = params[:fn]
	ln = params[:ln]
	age = params[:age]
	hair = params[:hair]
	eye = params[:eye]
	food = params[:food]
	#"#{fn} #{ln}, #{age}, #{hair}, #{eye}, #{food}"
	redirect 'drink?fn=' + fn + '&ln=' + ln + '&age=' + age + '&hair=' + hair + '&eye=' + eye + '&food=' + food
end

get '/drink' do 
	fn = params[:fn]
	ln = params[:ln]
	age = params[:age]
	hair = params[:hair]
	eye = params[:eye]
	food = params[:food]
	erb :drink, locals: {fn: fn, ln: ln, age: age, hair: hair, eye: eye, food: food}
end

post '/p_drink' do 
	fn = params[:fn]
	ln = params[:ln]
	age = params[:age]
	hair = params[:hair]
	eye = params[:eye]
	food = params[:food]
	drink = params[:drink]
	#{}"#{fn} #{ln}, #{age}, #{hair}, #{eye}, #{food}, #{drink}"
	redirect 'nums?fn=' + fn + '&ln=' + ln + '&age=' + age + '&hair=' + hair + '&eye=' + eye + '&food=' + food + '&drink=' + drink
end 

get '/nums' do 
	fn = params[:fn]
	ln = params[:ln]
	age = params[:age]
	hair = params[:hair]
	eye = params[:eye]
	food = params[:food]
	drink = params[:drink]
	erb :numbers, locals: {fn: fn, ln: ln, age: age, hair: hair, eye: eye, food: food, drink: drink}
end

post '/p_nums' do 
	fn = params[:fn]
	ln = params[:ln]
	age = params[:age]
	hair = params[:hair]
	eye = params[:eye]
	food = params[:food]
	drink = params[:drink]
	num1 = params[:num1]
	num2 = params[:num2]
	num3 = params[:num3]
	#sum = num1.to_i + num2.to_i + num3.to_i
	#"Hello #{fn} #{ln} at #{age} with #{hair} hair and #{eye} eyes. Your favorite food and drink #{food} and #{drink}. Your 3 favorite numbers are #{num1}, #{num2}, #{num3} and there sum is: #{sum}"
	redirect 'result?fn=' + fn + '&ln=' + ln + '&age=' + age + '&hair=' + hair + '&eye=' + eye + '&food=' + food + '&drink=' + drink + '&num1=' + num1 + '&num2=' + num2 + '&num3=' + num3
end

def multiply(age, sum)
	sum * age
end

get '/result' do 
	fn = params[:fn]
	ln = params[:ln]
	age = params[:age]
	hair = params[:hair]
	eye = params[:eye]
	food = params[:food]
	drink = params[:drink]
	num1 = params[:num1]
	num2 = params[:num2]
	num3 = params[:num3]
	sum = num1.to_i + num2.to_i + num3.to_i
	qwerty = multiply(age.to_i, sum)
	erb :result, locals: {fn: fn, ln: ln, age: age, hair: hair, eye: eye, food: food, drink: drink, num1: num1, num2: num2, num3: num3, sum: sum, qwerty: qwerty}
end
