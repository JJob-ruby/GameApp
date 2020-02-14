class MatchUsersController < ApplicationController
  before_action :set_match_user, only: [:show, :edit, :update, :destroy]

  # GET /match_users
  # GET /match_users.json
  def index
    @match_users = MatchUser.all
  end

  # GET /match_users/1
  # GET /match_users/1.json
  def show
  end

  # GET /match_users/new
  def new
    @match_user = MatchUser.new
  end

  # GET /match_users/1/edit
  def edit
  end

  # POST /match_users
  # POST /match_users.json
  def create
    @match_user = MatchUser.new(match_user_params)

    respond_to do |format|
      if @match_user.save
        format.html { redirect_to @match_user, notice: 'Match user was successfully created.' }
        format.json { render :show, status: :created, location: @match_user }
      else
        format.html { render :new }
        format.json { render json: @match_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /match_users/1
  # PATCH/PUT /match_users/1.json
  def update
    respond_to do |format|
      if @match_user.update(match_user_params)
        format.html { redirect_to @match_user, notice: 'Match user was successfully updated.' }
        format.json { render :show, status: :ok, location: @match_user }
      else
        format.html { render :edit }
        format.json { render json: @match_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_users/1
  # DELETE /match_users/1.json
  def destroy
    @match_user.destroy
    respond_to do |format|
      format.html { redirect_to match_users_url, notice: 'Match user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match_user
      @match_user = MatchUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_user_params
      params.fetch(:match_user, {})
    end
end
