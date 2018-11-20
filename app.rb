require './app/memo'
require './app/memos'
require 'pstore'

class App < Sinatra::Application
  configure do
    set :root, Dir.pwd
    set :storage, Dir.pwd + '/storage'
  end

  enable :method_override

  get '/' do
    Memos.set_storage(settings.storage)
    @memos = Memos.all.values
    erb :index
  end

  get '/memos/new' do
    erb :new
  end

  get '/memos/:id' do
    Memos.set_storage(settings.storage)
    @memo = Memos.find(params['id']).values.first
    erb :completed
  end

  get '/memos/:id/edit' do
    Memos.set_storage(settings.storage)
    @memo = Memos.find(params['id']).values.first
    erb :edit
  end

  post '/memos' do
    @memo = Memo.create(params[:title], params[:body])
    Memos.set_storage(settings.storage)
    Memos.add(@memo)
    redirect to("/memos/#{@memo.id}")
  end

  patch '/memos/:id' do
    Memos.set_storage(settings.storage)
    @memo = Memos.find(params['id']).values.first
    @memo.update(params)
    Memos.add(@memo)
    erb :completed
  end

  delete '/memos/:id' do
    Memos.set_storage(settings.storage)
    Memos.delete(params['id'])
    redirect to('/')
  end
end
