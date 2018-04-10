module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    sort_icon_class =
      column == params[:sort] ? sort_direction == "desc" ? "sort-desc" : "sort-asc" : "sort"

    link_to({:sort => column, :direction => direction, :remote => true}, :class => css_class) do
      raw("#{title}#{fa_icon("#{sort_icon_class} sort-padding")}")
    end
  end

  def goal_ranking_name(player_id)
    player = Player.find(player_id)
    "#{player.position_text}　#{player.name}"
  end

  def title_label(icon_name, title_name)
    fa_icon("#{icon_name} " 'title-padding') + title_name
  end
end
