require "sinatra"
require "sinatra/reloader"
require 'tilt/erubis'
require 'yaml'

before do
  @users = YAML.load_file('data/users.yaml')
end

helpers do
  def count_interests
    @users.map { |user| user[1][:interests].count }.reduce(&:+)
  end
end

get "/" do
  redirect '/users'
end

get "/users" do
  erb :users
end

get "/user/:name" do
  @user = @users[params[:name].to_sym]
  erb :user
end
