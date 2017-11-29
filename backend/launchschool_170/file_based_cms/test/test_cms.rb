ENV['RACK_ENV'] = 'test'

require 'fileutils'

require 'minitest/autorun'
require 'rack/test'

require_relative '../cms'

class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end
  
  def create_document(name, content = '')
    File.open(File.join(data_path, name), 'w') { |file| file.write(content) }
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { "rack.session" => { username: "admin" } }
  end

  def test_index
    create_document 'about.md'
    create_document 'changes.txt'
    create_document 'history.txt'
    get '/'
    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
    assert_includes last_response.body, "history.txt"
  end

  def test_about
    create_document 'about.md', content = 'about'
    get '/about.md'
    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, 'about'
  end

  def test_changes
    create_document 'changes.txt', content = "changes\n"
    get '/changes.txt'
    assert_equal 200, last_response.status
    assert_equal 'text/plain', last_response['Content-Type']
    assert_equal "changes\n", last_response.body
  end

  def test_history
    create_document 'history.txt', content = "2007 - Ruby 1.9 released."
    get '/history.txt'
    assert_equal 200, last_response.status
    assert_equal 'text/plain', last_response['Content-Type']
    assert_includes last_response.body, '2007 - Ruby 1.9 released.'
  end

  def test_invalid_file
    get '/notafile.txt'
    assert_equal 302, last_response.status

    assert_equal 'notafile.txt does not exist.', session[:message]
  end

  def test_editing_document_signed_in
    create_document 'about.md'
    get '/about.md/edit', {}, admin_session
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'Edit content of'
  end

  def test_editing_document_signed_out
    create_document 'about.md'
    get '/about.md/edit'
    assert_equal 302, last_response.status

    get last_response['Location']
    assert_includes last_response.body, 'You must be signed in to do that.'
  end

  def test_updating_document_signed_in
    create_document 'about.md'
    post '/about.md/edit', {content: 'new content'}, admin_session
    assert_equal 302, last_response.status

    assert_equal 'about.md has been updated.', session[:message]

    get '/about.md'
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'new content'
  end

  def test_updating_document_signed_out
    create_document 'about.md'
    post '/about.md/edit', {content: 'new content'}
    assert_equal 302, last_response.status

    get last_response['Location']
    assert_includes last_response.body, 'You must be signed in to do that.'
  end

  def test_new_document_form_signed_in
    get '/new', {}, admin_session
    assert_equal 200, last_response.status
    assert_includes last_response.body, '<label>Add a new document:</label>'
  end

  def test_new_document_form_signed_out
    get '/new'
    assert_equal 302, last_response.status

    get last_response['Location']
    assert_includes last_response.body, 'You must be signed in to do that.'
  end

  def test_creating_new_document_signed_in
    post '/new', {document_name: 'test_document.md'}, admin_session
    assert_equal 302, last_response.status

    get last_response['Location']
    assert_includes last_response.body, 'test_document.md'
  end

  def test_creating_new_document_signed_out
    post '/new', {document_name: 'test_document.md'}
    assert_equal 302, last_response.status

    get last_response['Location']
    assert_includes last_response.body, 'You must be signed in to do that.'
  end
  
  def test_blank_document_name
    post '/new', {document_name: ''}, admin_session
    assert_equal 302, last_response.status

    assert_equal 'Document name must not be empty.', session[:message]
  end

  def test_missing_file_extension
    post '/new', {document_name: 'test'}, admin_session
    assert_equal 302, last_response.status

    assert_equal 'Document name must have an extension.', session[:message]
  end

  def test_deleting_a_file_signed_in
    create_document 'test_delete.md'
    post '/test_delete.md/delete', {}, admin_session
    assert_equal 302, last_response.status

    assert_equal 'test_delete.md was deleted.', session[:message]
  end

  def test_deleting_a_file_signed_out
    create_document 'test_delete.md'
    post '/test_delete.md/delete'
    assert_equal 302, last_response.status

    get last_response['Location']
    assert_includes last_response.body, 'You must be signed in to do that.'
  end

  def test_signin_page
    get '/users/signin'
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<button type='submit'>Sign In</button>"
  end

  def test_bad_credentials
    post '/users/signin', username: 'test', password: 'test'
    assert_equal 302, last_response.status

    assert_equal 'Invalid Credentials', session[:message]
  end

  def test_good_credentials
    post '/users/signin', username: 'admin', password: 'secret'
    assert_equal 302, last_response.status

    get last_response['Location']
    assert_includes last_response.body, 'Welcome!'
  end

  def test_sign_out
    post '/users/signout'
    assert_equal 302, last_response.status

    assert_equal 'You have been signed out.', session[:message]
  end

  def test_that_only_valid_file_types_are_allowed
    post '/new', { document_name: 'test.nope' }, admin_session
    assert_equal 302, last_response.status

    get last_response['Location']
    assert_includes last_response.body, 'Invalid file type.'
  end
end
