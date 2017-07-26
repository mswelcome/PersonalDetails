#Extended PersonalDetails

require "sinatra"

get '/' do	
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
	"#{fn} #{ln}, #{age}, #{hair}, #{eye}, #{food}, #{drink}"
	#redirect 'nums?fn=' + fn + '&ln=' + ln + '&age=' + age + '&hair=' + hair + '&eye=' + eye + '&food=' + food + '&drink=' + drink
end 
