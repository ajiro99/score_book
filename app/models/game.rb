class Game < ApplicationRecord
  extend Enumerize
#TODO: pk追加
  belongs_to :convention
  belongs_to :opponent
  has_many :results

  enumerize :home_away, in: { home: 0, away: 1, neutral: 2 }, scope: true
  enumerize :weather, in: { sunny: 0, cloudy: 1, rain: 2, snow: 3 }, scope: true
  enumerize :result, in: { win: 0, draw: 1, lose: 2, }, scope: true
end
