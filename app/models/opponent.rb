class Opponent < ApplicationRecord
  extend Enumerize

  has_many :games

  enumerize :category, in: { j1: 0, j2: 1, j3: 2 }, scope: true
end
