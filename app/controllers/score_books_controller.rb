class ScoreBooksController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @games = GameDecorator.decorate_collection(Game.all.order(sort_column + ' ' + sort_direction))
    @goal_ranking = Convention.find(1).games.joins(:goal_patterns).group(:player_id).order('count_all desc').limit(5).count

    gon.goal_players = @goal_ranking.keys.map {|player| Player.find(player).name.split(" ").first}
    gon.goal_players << "その他"

    gon.goals = @goal_ranking.values

    goal_ranker_total_goals = 0
    @goal_ranking.values.each do |goal|
      goal_ranker_total_goals += goal
    end

    total_goals = 0
    Game.all.each do |game|
      total_goals += game.gool
    end

    gon.goals << (total_goals - goal_ranker_total_goals)
  end

  def game_detail
    game = Game.find(params[:id])
    gon.opponent_name = game.opponent.name
    gon.result = [game.shoot, game.ck, game.fk]
    gon.opponent_result  = [game.shoot_against, game.ck_against, game.fk_against]
    @game = game.decorate
  end

  private

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def sort_column
      Game.column_names.include?(params[:sort]) ? params[:sort] : "date"
  end
end
