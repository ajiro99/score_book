class Admin::GoalPatternsController < Admin::BaseController
  layout 'admin/application'
  before_action :set_goal_pattern, only: [:show, :edit, :update, :destroy]

  def index
    @goal_patterns = GoalPattern.all
  end

  def show
  end

  def new
    @goal_pattern = GoalPattern.new
  end

  def edit
  end

  def create
    @goal_pattern = GoalPattern.new(goal_pattern_params)

    respond_to do |format|
      if @goal_pattern.save
        format.html { redirect_to edit_admin_goal_pattern_path(@goal_pattern), notice: 'GoalPattern was successfully created.' }
        format.json { render :show, status: :created, location: @goal_pattern }
      else
        format.html { render :new }
        format.json { render json: @goal_pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @goal_pattern.update(goal_pattern_params)
        format.html { redirect_to edit_admin_goal_pattern_path(@goal_pattern), notice: 'GoalPattern was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_pattern }
      else
        format.html { render :edit }
        format.json { render json: @goal_pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @goal_pattern.destroy
    respond_to do |format|
      format.html { redirect_to admin_goal_patterns_url, notice: 'GoalPattern was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_pattern
      @goal_pattern = GoalPattern.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_pattern_params
      params.require(:goal_pattern).permit(:game_id, :player_id, :goal_time, :assist_player_id, :pattern, :starting_area, :goal_area, :goal_parts)
    end
end
