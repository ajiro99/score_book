class GoalPatternDecorator < Draper::Decorator
  delegate_all

  def goal_and_assist_player
    assist_player_name = assist_player&.name.blank? ? '' : "（#{assist_player.name}）"
    "#{player.name}#{assist_player_name}"
  end

  def goal_pattern
    "（#{goal_parts_text} / #{goal_area_text}）"
  end

  def goal_time_decorate
    format_minute(goal_time)
  end

  private
  def format_minute(time)
    "#{time}'"
  end
end