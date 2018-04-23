class Admin::GamesController < Admin::BaseController
  layout 'admin/application'
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = GameDecorator.decorate_collection(Game.all)
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to [:admin, @game], notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to [:admin, @game], notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to admin_games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(
        :convention_id ,:section, :date, :start_time, :opponent_id, :home_away, :weather, :temperature, :referee,
        :result, :goal, :goal_against, :shoot, :shoot_against, :ck, :ck_against, :fk, :fk_against, :yellow_card,
        :gave_yellow_card, :red_card, :gave_red_card, :dominance_rate, :first_change_time, :first_change_out_id,
        :first_change_in_id, :second_change_time, :second_change_out_id, :second_change_in_id, :third_change_time,
        :third_change_out_id, :third_change_in_id, :number_of_visitors, :rank, :pk, :pk_against, :video_url
      )
    end
end
