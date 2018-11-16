class App < Sinatra::Application
  configure do
    set :root, Dir.pwd
  end

  get '/' do
    erb :index
  end
end
