class Player < ApplicationRecord
  extend Enumerize

  has_many :results

  enumerize :position, in: { gk: 0, df: 1, mf: 2, fw: 3 }, scope: true

  # TODO:後で出身地、全所属を追加
end
