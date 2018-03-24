class GamesDecorator < Draper::CollectionDecorator
  def total_count(column)
    count = 0
    self.each do |game|
      count += game.send(column)
    end
    count
  end

  def gool_difference
    total_count(:gool) - total_count(:gool_against)
  end

  def result_count(type)
    Game.with_result(type).size
  end
end
