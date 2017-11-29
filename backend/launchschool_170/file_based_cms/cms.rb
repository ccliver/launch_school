require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'

root = File.expand_path('..', __FILE__)

configure do
  enable :sessions
  set :session_secret, ENV['CMS_SESSION_SECRET']
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_contents(path)
  case File.extname(path)
  when '.txt'
    headers['Content-type'] = 'text/plain'
    File.read(path)
  when '.md'
    render_markdown(File.read(path))
  end
end

def data_path
  if ENV['RACK_ENV'] == 'test'
    File.expand_path('../test/data', __FILE__)
  else
    File.expand_path('../data', __FILE__)
  end
end

def user_authenticated?
  session.key?(:username)
end

def block_unauthenticated_users
  unless user_authenticated?
    session[:message] = 'You must be signed in to do that.'
    redirect '/'
  end
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end
  YAML.load_file(credentials_path)
end

def valid_credentials?(username, password)
  credentials = load_user_credentials

  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username])
    bcrypt_password == password
  else
    false
  end
end

def valid_file_type?(extension)
  allowed_extensions = ['.txt', '.md']
  allowed_extensions.include?(extension)
end

get '/' do
  pattern = File.join(data_path, '*')
  @files = Dir.glob(pattern).map { |file| File.basename(file) }
  erb :index
end

get '/users/signin' do
  erb :signin
end

get '/new' do
  block_unauthenticated_users

  erb :new_document
end

get '/:filename' do
  unless File.exist? File.join(data_path, params[:filename])
    session[:message] = "#{params[:filename]} does not exist."
    redirect '/'
  end

  load_file_contents(File.join(data_path, params[:filename]))
end

get '/:filename/edit' do
  block_unauthenticated_users

  @content = File.read(File.join(data_path, params[:filename]))
  erb :edit
end

post '/:filename/delete' do
  block_unauthenticated_users

  File.delete(File.join(data_path, params[:filename]))
  session[:message] = "#{params[:filename]} was deleted."
  redirect '/'
end

post '/:filename/edit' do
  block_unauthenticated_users

  File.open(File.join(data_path, params[:filename]), 'w') { |file| file.write(params[:content]) }
  session[:message] = "#{params[:filename]} has been updated."
  redirect '/'
end

post '/new' do
  block_unauthenticated_users

  document_name = File.basename(params[:document_name])

  if document_name.empty?
    session[:message] = 'Document name must not be empty.'
    redirect '/new'
  elsif File.extname(document_name) == ''
    session[:message] = 'Document name must have an extension.'
    redirect '/new'
  elsif ! valid_file_type?(File.extname(params[:document_name]))
    session[:message] = 'Invalid file type.'
    redirect '/new'
  end

  File.open(File.join(data_path, document_name), 'w') { }
  session[:message] = "#{document_name} was created."
  redirect '/'
end

post '/users/signin' do
  username = params[:username]

  if valid_credentials?(username, params[:password])
    session[:username] = username
    session[:message] = "Welcome!"
    redirect "/"
  else
    session[:message] = "Invalid Credentials"
    redirect '/users/signin'
  end
end

post '/users/signout' do
  session.delete(:username)
  session[:message] = 'You have been signed out.'
  redirect '/'
end
