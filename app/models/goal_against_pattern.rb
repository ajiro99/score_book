class GoalAgainstPattern < ApplicationRecord
  include GoalPatternBase

  belongs_to :game
  has_one :goal_against_player, class_name: 'Player', primary_key: :goal_against_player_id, foreign_key: :id
end
