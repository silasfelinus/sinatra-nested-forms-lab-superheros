require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
        
    end

    post '/teams' do
        @team = Team.new(params[:team])
        params[:team][:heroes].each do |details|
            Hero.new(details)
        end

        @heros = Hero.all
        @hero1 = @team[0]
        @hero2 = @team[1]
        @hero3 = @team[2]
        erb :team
    end


end

