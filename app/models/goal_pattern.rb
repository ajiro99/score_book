class GoalPattern < ApplicationRecord
  include GoalPatternBase

  belongs_to :game
  belongs_to :player
  has_one :assist_player, class_name: 'Player', primary_key: :assist_player_id, foreign_key: :id
end
