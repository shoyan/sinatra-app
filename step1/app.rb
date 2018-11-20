require './app/memo'
require './app/memos'
require 'pstore'

class App < Sinatra::Application
  configure do
    set :root, Dir.pwd

    # Sets storage path
    set :storage, Dir.pwd + '/tmp/storage'
  end

  # List memos
  get '/' do
    Memos.set_storage(settings.storage)
    @memos = Memos.all.values
    erb :index
  end

  # Display memo form
  get '/memos/new' do
    erb :new
  end

  # Detail memo
  get '/memos/:id' do
    Memos.set_storage(settings.storage)
    @memo = Memos.find(params['id']).values.first
    erb :detail
  end

  # Create memo
  post '/memos' do
    @memo = Memo.create(params[:title], params[:body])
    Memos.set_storage(settings.storage)
    Memos.add(@memo)
    redirect to("/memos/#{@memo.id}")
  end
end
