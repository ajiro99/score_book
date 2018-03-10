class Game < ApplicationRecord
  belongs_to :convention
  belongs_to :opponent
end
