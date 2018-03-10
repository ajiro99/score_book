class Convention < ApplicationRecord
  extend Enumerize

  enumerize :convention_type, in: { j_league: 0, j_league_cup: 1, emperor_cup: 2, acl: 3 }, scope: true
  # enumerize :convention_type, in: [ :j_league, :j_league_cup, :emperor_cup, :acl ]
end
