require 'gossip'

class GossipProjectApp < Sinatra::Base
  attr_accessor :id

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossips
  end

  get '/gossips/:id/' do
    @id = params[:id]
    erb :profile_gossip
  end

  post '/gossips/new' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    puts "Racontard enregistré"
    redirect '/'
  end
end
