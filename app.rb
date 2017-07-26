require "sinatra"
enable :sessions

get '/' do 
#session[:age] = 5

erb :names
end

post '/names' do
	session[:age] = 5
  fn = params[:f_name]
  redirect '/last_names?first_name=' + fn
end

get '/last_names' do 
	first_name = params[:first_name]
	erb :last_names, locals: {fn: first_name}
end

post '/l_names' do
	last_names = params[:ln]
	first_name = params[:fn]
	redirect '/numbers?last_name=' + last_names + '&first_name=' + first_name
end

get '/numbers' do
	first_name = params[:first_name]
	last_name = params[:last_name]
	erb :numbers, locals: {fn: first_name, ln: last_name, age: session[:age]}
end

post '/knowthyself' do
	num1 = params[:num1]
	num2 = params[:num2]
	num3 = params[:num3]
	first_name = params[:first_name]
	last_name = params[:last_name]
	age = session[:age]
	redirect 'knowthyenemy?num1=' + num1 + '&num2=' + num2 + '&num3=' + num3 + '&first_name=' + first_name + '&last_name=' + last_name
end

get '/knowthyenemy' do
	num1 = params[:num1]
	num2 = params[:num2]
	num3 = params[:num3]		
	first_name = params[:first_name]
	last_name = params[:last_name]
	erb :results, locals: {fn: first_name, ln: last_name, n1: num1, n2: num2, n3: num3}
end