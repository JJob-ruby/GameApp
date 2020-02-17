class ScoresController < ApplicationController
#  before_action :set_score, only: [:show, :edit, :update, :destroy]

  # GET /scores
  # GET /scores.json
  def index
    @scores = Score.all
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
  end

  # GET /scores/new
  def new
    @score = Score.new
		Score.find_by match_id: 'Spartacus', rating: 4

  end

  # GET /scores/1/edit
  def edit
  end

  # POST /scores
  # POST /scores.json
  def create
    
		print "I guess we are here"	

		scores = score_params
		@round  = params["round"]
		match_id= params["match_id"]

		@scoreArray=[]		
	
		ActiveRecord::Base.transaction do
			
			scores.each do |u_id, sc|

				print "match id is #{match_id} user id is #{u_id}"
				@mu=MatchUser.find_by! match_id: match_id, user_id: u_id				
				
				if Score.exists? match_user_id: @mu.id, round: @round
					@score= Score.find_by! match_user_id: @mu.id, round: @round
					@score.update!( score: sc)
	
				else
					@score=Score.new(match_user_id: @mu.id, score: sc, round: @round)
					if @score.save!
					
					else
						
					end
				end
			end
		end
		redirect_to edit_match_path(params["match_id"])
	end
					


  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url, notice: 'Score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score)
    end
end
