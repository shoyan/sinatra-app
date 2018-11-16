require './app/memo'

class App < Sinatra::Application
  configure do
    set :root, Dir.pwd
  end

  get '/' do
    erb :index
  end

  post '/' do
    @memo = Memo.create(params[:title], params[:body])
    erb :completed
  end
end
