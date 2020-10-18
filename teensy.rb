#teensy.rb
require 'sinatra'

get '/' do
  # Show homepage
  @title = "Home"
end

post '/' do
  # Put the fatty URL in the database and display
  items = DB[:teensyurls]
  id = items.insert(:url => params[:url])
  url = request.url + id.to_s(64)
  "Teensy-ified URL is: <a href='#{url}'>#{url}</a>"
end

get '/:teensyid' do
  # Resolve the teensy URL
  items = DB[:teensyurls]
  id = params[:teensyid].to_i(64)
  url = items.first(:id => id)
  redirect url[:url]
end
