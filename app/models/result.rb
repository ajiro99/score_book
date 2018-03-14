class Result < ApplicationRecord
  extend Enumerize

  belongs_to :game
  belongs_to :player

  enumerize :participation, in: { starting: 0, half_way_out: 1, no_participation: 2 }, scope: true
end
