class Game < ApplicationRecord
  extend Enumerize

  belongs_to :convention
  belongs_to :opponent
  has_many :results
  has_many :goal_patterns
  has_many :goal_against_patterns
  has_one :first_change_out_player, class_name: 'Player', primary_key: :first_change_out_id, foreign_key: :id
  has_one :first_change_in_player, class_name: 'Player', primary_key: :first_change_in_id, foreign_key: :id
  has_one :second_change_out_player, class_name: 'Player', primary_key: :second_change_out_id, foreign_key: :id
  has_one :second_change_in_player, class_name: 'Player', primary_key: :second_change_in_id, foreign_key: :id
  has_one :third_change_out_player, class_name: 'Player', primary_key: :third_change_out_id, foreign_key: :id
  has_one :third_change_in_player, class_name: 'Player', primary_key: :third_change_in_id, foreign_key: :id

  enumerize :home_away, in: { home: 0, away: 1, neutral: 2 }, scope: true
  enumerize :weather, in: { sunny: 0, cloudy: 1, rain: 2, snow: 3 }, scope: true
  enumerize :result, in: { win: 0, draw: 1, lose: 2, }, scope: true
end
