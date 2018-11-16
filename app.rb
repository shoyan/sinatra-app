require './app/memo'
require './app/memos'
require 'pstore'

class App < Sinatra::Application
  configure do
    set :root, Dir.pwd
    set :storage, Dir.pwd + '/storage'
  end

  get '/' do
    Memos.set_storage(settings.storage)
    @memos = Memos.all
    erb :index
  end

  get '/memo/new' do
    erb :new
  end

  post '/' do
    @memo = Memo.create(params[:title], params[:body])
    Memos.set_storage(settings.storage)
    Memos.add(@memo)
    erb :completed
  end
end
