require './app/memo'
require 'pstore'

class App < Sinatra::Application
  configure do
    set :root, Dir.pwd
    set :storage, Dir.pwd + '/storage'
  end

  get '/memo/new' do
    erb :index
  end

  get '/' do
    store = PStore.new(settings.storage)

    @memo = store.transaction do
      store['memo']
    end

    erb :completed
  end


  post '/' do
    @memo = Memo.create(params[:title], params[:body])

    store = PStore.new(settings.storage)
    store.transaction do
      store['memo'] = @memo
    end

    erb :completed
  end
end
