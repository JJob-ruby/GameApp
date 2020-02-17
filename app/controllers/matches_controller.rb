

class MatchesController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

  def new
    @match=Match.new
    @games=Game.select([:name, :number_of_players, :id])
    @users=User.all
    @us= @users.collect {|u| u.name}
    @uid= @users.collect {|u| u.id}
	
    print @games
  end

  def index
    @matches=Match.all
  end
 
  def show
  
		print "Match id is #{params[:id]}"
    @match= Match.find(params[:id])
    @users= @match.users
		print "Users are #{@users} "
    
  end

  def create
    match_game=match_params[:game]
		match_name=match_params[:name]
    match_users=user_params

    #The value from the game select box is itself a json variable that has to be parsed further.
    game = ActiveSupport::JSON.decode(match_game)
    print "Match is #{game}"

    #The actual match parameters that go into the model
    @match_parameters=Hash.new
    @match_parameters[:game_id]=game["id"]

    @game=Game.find(game["id"])

    @match_parameters[:name]=match_name

    print "\n match params are #{@match_parameters} \n"

    @match=Match.new(@match_parameters)

    
		ActiveRecord::Base.transaction do
			if @match.save
	'''
			    ActiveRecord::Base.transaction do
	'''
				print "\n \nMatch is #{@match}, id is #{@match.id} \n \n"
			  redirect_to matches_path

			else
			  print "not saved"
			  print @match.errors.full_messages
			end

			player_ids = user_params.values.map{|t| t.to_i}

			player_ids.each do |player_id|

				@match_user = MatchUser.new(match_id: @match.id, user_id: player_id)

				if @match_user.save!
					print "\n match user successfully created \n"
				else
					print "\nmatch_user not created\n"
					print @match_user.errors.full_messages
				end
			end

		end
  end
  
  def edit	

		print "Match id is #{params[:id]}"
    @match= Match.find(params[:id].to_i)
    @users= @match.users
		print "Users are #{@users} "

'''
		if MatchUser.exists? match_id: params[:id]
			mu=MatchUser.find_by(match_id: params[:id])
			sc=mu.scores
			@rounds=sc.select(:round).distinct

			@rounds.each do |round|
				@users.each do |user|
					mu=MatchUser.find_by(match_id: params[:id], user_id: user.id)
					mu_score= mu.scores.find_by(match_user_id: mu.id).score
					print " \n mu_score is #{mu_score} \n"
				end
			end
		end
'''
  end

  def destroy
  end

  private
    def match_params
      params.require(:match)
    end

    def user_params
      params.require(:user)
    end

end
