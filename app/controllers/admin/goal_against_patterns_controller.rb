class Admin::GoalAgainstPatternsController < Admin::BaseController
  layout 'admin/application'
  before_action :set_goal_against_pattern, only: [:show, :edit, :update, :destroy]

  def index
    @goal_against_patterns = GoalAgainstPattern.all
  end

  def show
  end

  def new
    @goal_against_pattern = GoalAgainstPattern.new
  end

  def edit
  end

  def create
    @goal_against_pattern = GoalAgainstPattern.new(goal_against_pattern_params)

    respond_to do |format|
      if @goal_against_pattern.save
        format.html { redirect_to edit_admin_goal_against_pattern_path(@goal_against_pattern), notice: 'GoalAgainstPattern was successfully created.' }
        format.json { render :show, status: :created, location: @goal_against_pattern }
      else
        format.html { render :new }
        format.json { render json: @goal_against_pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @goal_against_pattern.update(goal_against_pattern_params)
        format.html { redirect_to edit_admin_goal_against_pattern_path(@goal_against_pattern), notice: 'GoalAgainstPattern was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_against_pattern }
      else
        format.html { render :edit }
        format.json { render json: @goal_against_pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @goal_against_pattern.destroy
    respond_to do |format|
      format.html { redirect_to admin_goal_against_patterns_url, notice: 'GoalAgainstPattern was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_against_pattern
      @goal_against_pattern = GoalAgainstPattern.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_against_pattern_params
      params.require(:goal_against_pattern).permit(:game_id, :goal_against_time, :goal_against_player_id, :pattern, :starting_area, :goal_area, :goal_parts)
    end
end
