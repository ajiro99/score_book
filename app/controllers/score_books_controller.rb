class ScoreBooksController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    convention = Convention.find(1)
    games = convention.games.performed.order(sort_column + ' ' + sort_direction)
    @goal_ranking = convention.games.joins(:goal_patterns).group(:player_id).order('count_all desc').limit(5).count

    gon.goal_players = @goal_ranking.keys.map {|player| Player.find(player).name.split(" ").first}
    gon.goal_players << "その他"

    gon.goals = @goal_ranking.values
    gon.goals << (games.sum(:goal) - @goal_ranking.values.sum())

    gon.leage_section = games.pluck(:section)
    gon.leage_rank = games.pluck(:rank)

    home_games = games.with_home_away(:home)
    gon.home_section = home_games.pluck(:section)
    gon.visitors_rank = home_games.pluck(:number_of_visitors)

    gon.ave_dominance_rate = [
      games.average(:dominance_rate).round, (100 - games.average(:dominance_rate)).round
    ]
    gon.home_ave_dominance_rate = [
      home_games.average(:dominance_rate).round, 100 - (home_games.average(:dominance_rate)).round
    ]

    @games = GameDecorator.decorate_collection(games)
  end

  def game_detail
    game = Game.find(params[:id])
    gon.opponent_name = game.opponent.name
    gon.result = [game.shoot, game.ck, game.fk]
    gon.opponent_result  = [game.shoot_against, game.ck_against, game.fk_against]
    @game = game.decorate
  end

  def about
  end

  def schedule
    convention = Convention.find(1)
    @first_half_games = GameDecorator.decorate_collection(convention.games.limit(17).offset(0))
    @second_half_games = GameDecorator.decorate_collection(convention.games.limit(17).offset(17))
  end

  def players
    convention = Convention.find(1)
    @players = Player.left_joins(:results)
               .select("players.*, sum(results.time) AS sum_time, sum(results.goal) AS sum_goal,
                        sum(results.goal_against) AS sum_goal_against, sum(results.shoot) AS sum_shoot,
                        sum(results.shoot_against) AS sum_shoot_against, sum(results.yellow_card) AS sum_yellow_card,
                        sum(results.red_card) AS sum_red_card, sum(results.assist) AS sum_assist,
                        (select count(*) from players as p
                           inner join results as r ON p.id  = r.player_id
                           where r.participation <> 2 and r.player_id = players.id) as participation_count")
               .where(year: convention.year)
               .group(:id)
               .order(sort_column + ' ' + sort_direction)
  end

  private

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def sort_column
    if params[:action] == 'players'
      sum_column_list = %w(sum_time sum_goal sum_shoot sum_assist sum_goal_against sum_shoot_against
                           sum_yellow_card sum_red_card participation_count)
      player_column_names = Player.column_names << sum_column_list
      player_column_names.flatten.include?(params[:sort]) ? params[:sort] : "position"
    else
      Game.column_names.include?(params[:sort]) ? params[:sort] : "date"
    end
  end
end
