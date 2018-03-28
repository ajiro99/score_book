class GoalPattern < ApplicationRecord
  extend Enumerize

  belongs_to :game
  belongs_to :player
  has_one :assist_player, class_name: 'Player', primary_key: :assist_player_id, foreign_key: :id

  enumerize :pattern, in: { ck: 1, fk: 2, pk: 3, throw_in: 4, gk: 5, counter: 10, slow_attack: 11, own_goal: 99 }, scope: true
  enumerize :starting_area, in: { left: 1, center: 2, right: 3 }, scope: true
  enumerize :goal_area, in: { pa_in: 1, pa_out: 2 }, scope: true
  enumerize :goal_parts, in: { left: 1, right: 2, head: 3, other: 4 }, scope: true
end
