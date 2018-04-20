class GamesDecorator < Draper::CollectionDecorator
  def total_count(column)
    count = 0
    self.each do |game|
      count += game.send(column)
    end
    count
  end

  def goal_difference
    total_count(:goal) - total_count(:goal_against)
  end

  def result_count(type)
    Game.with_result(type).size
  end

  def rank_unit
    last.rank.ordinalize[-2, 2]
  end

  def last_game_date
    "第#{last.section_decorate}　#{last.date_decorate(is_color: false)} #{last.start_time_decorate} Kick off（#{last.home_away_text}）"
  end

  def last_game_result
    "vs #{last.opponent.name}　#{last.goal} - #{last.goal_against}"
  end
end
