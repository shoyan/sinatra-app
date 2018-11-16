class App < Sinatra::Application
  configure do
    set :root, Dir.pwd
  end

  get '/' do
    erb :index
  end

  post '/' do
    @title = params[:title]
    @body = params[:body]
    erb :completed
  end
end
