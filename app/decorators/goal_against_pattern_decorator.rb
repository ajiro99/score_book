class GoalAgainstPatternDecorator < Draper::Decorator
  delegate_all

  def goal_against_player_decorate
    "失点（#{goal_against_player.name}）"
  end

  def goal_against_time_decorate
    format_minute(goal_against_time)
  end

  private
  def format_minute(time)
    "#{time}'"
  end
end