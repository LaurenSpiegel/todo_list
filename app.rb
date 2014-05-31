require 'sinatra'
require 'mongo'

mongo = Mongo::MongoClient.new
db = mongo['test']
coll = db['todo']

configure :development do
  set :bind, '0.0.0.0' #ok to listen to anybody
  set :port, 3000  #use localhost:3000
end


get '/' do
  @todos = coll.find()
  erb :home
end

get '/new_todo' do
  coll.insert({name: params[:name]})
  'added!'
end






