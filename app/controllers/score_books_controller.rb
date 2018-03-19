class ScoreBooksController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @games = GameDecorator.decorate_collection(Game.all.order(sort_column + ' ' + sort_direction))
  end

  def game_detail
    @game = Game.find(params[:id])
  end

  private

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def sort_column
      Game.column_names.include?(params[:sort]) ? params[:sort] : "date"
  end
end
