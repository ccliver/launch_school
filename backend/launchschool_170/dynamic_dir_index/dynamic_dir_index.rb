require "sinatra"
require "sinatra/reloader"
require 'tilt/erubis'

get "/" do
  @title = 'Dynamic Directory Index'
  @files = Dir.entries('public').select { |file| file != '.' && file != '..' }
  @files.reverse if params[:sort] == 'desc'
  erb :home
end
