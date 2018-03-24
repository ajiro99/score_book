class ScoreBooksController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @games = GameDecorator.decorate_collection(Game.all.order(sort_column + ' ' + sort_direction))
  end

  def game_detail
    game = Game.find(params[:id])
    gon.opponent_name = game.opponent.name
    gon.result = [game.shoot, game.ck, game.fk]
    gon.opponent_result  = [game.shoot_against, game.ck_against, game.fk_against]
    @game = game
  end

  private

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def sort_column
      Game.column_names.include?(params[:sort]) ? params[:sort] : "date"
  end
end
