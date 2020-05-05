#!/usr/bin/env ruby
require 'sinatra'
require "sinatra/reloader"
require "pony"

get '/' do
	erb :index
end

post '/enquire' do
	return "Ooops no..." if params[:sweets].length > 0

	if params[:email].length > 0
		Pony.options = {
			from: 'hello@maawol.com',
			via: :smtp,
	    via_options: {
	      address: 'smtp.fastmail.com',
	      user_name: 'hello@maawol.com',
	      password: ENV['FASTMAIL_PASSWORD'],
	      port: '587',
	    }
	 	}
		Pony.mail({
			to: "steve@maawol.com",
	    subject: "New Maawol brochure enquiry from #{params[:email]}",
	    html_body: "Hi Steve,<br /><br />You have a new Maawol brochure enquiry from #{params[:name]} <a href='#{params[:email]}'>#{params[:email]}</a>
	    	<hr /><br />#{params[:message]}"
	  })
	end
  "success"
end

get '/sitemap.xml' do
	erb :sitemap
end

get '/googled9fd1599fe07f849.html' do
	return 'google-site-verification: googled9fd1599fe07f849.html'
end