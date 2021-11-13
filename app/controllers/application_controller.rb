require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
        
    end

    post '/teams' do
        @team = Team.new(params[:team])
        params[:team][:heros].each do |details|
            Hero.new(details)
        end

        @heros = Hero.all
        @hero1 = @teams[0]
        @hero2 = @teams[1]
        @hero3 = @teams[2]
        erb :team
    end


end

