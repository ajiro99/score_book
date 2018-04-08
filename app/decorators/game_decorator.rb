class GameDecorator < Draper::Decorator
  delegate_all
  decorates_association :goal_patterns
  decorates_association :goal_against_patterns
  decorates_association :starting_members
  decorates_association :sub_members

  def section_decorate
    "#{section}節"
  end

  def date_decorate(is_color: true)
    h.raw("#{date.strftime('%-m/%d')}#{day_of_week(date, is_color)}")
  end

  def start_time_decorate
    start_time.strftime("%H:%M")
  end

  def home_away_decorate
    return font_tag(home_away_text, 'red') if home_away.home?
    home_away_text
  end

  def weather_decorate
  	return h.fa_icon("sun-o lg red") if weather.sunny?
  	return h.fa_icon("cloud lg gray") if weather.cloudy?
    h.fa_icon("umbrella lg blue")
  end

  def result_decorate
  	return h.fa_icon("circle-thin lg") if result.win?
  	return font_tag("△", nil, 3) if result.draw?
  	h.fa_icon("circle lg")
  end

  def temperature_decorate(is_color: true)
  	value = "#{temperature}℃"
    return value unless is_color
    return font_tag(value, 'red') if temperature >= 25
    return font_tag(value, 'blue') if temperature <= 9
    value
  end

  def dominance_rate_decorate
    "#{dominance_rate}%"
  end

  def opponent_dominance_rate_decorate
    "#{100 - dominance_rate}%"
  end

  def opponent_home_away
    home_away.home? ? "Away" : "Home"
  end

  def number_of_visitors_decorate(is_color: true)
    value = "#{number_of_visitors.to_s(:delimited)}人"
    return value unless is_color
    return font_tag(value, 'red') if number_of_visitors >= 20000
    return font_tag(value, 'blue') if number_of_visitors <= 9999
    value
  end

  def detail_date(is_color: true)
    h.raw("　第#{section_decorate} #{date_decorate(is_color: is_color)}  #{start_time_decorate} kick off　 VS #{opponent.name}")
  end

  def ather_date
    h.raw("天候：#{weather_text}　気温：#{temperature}℃")
  end

  def first_change_time_decorate
    format_minute(first_change_time)
  end

  def second_change_time_decorate
    format_minute(second_change_time)
  end

  def third_change_time_decorate
    format_minute(third_change_time)
  end

  private

  def day_of_week(date, is_color = true)
    return %w{（月） （火） （水） （木） （金） （土） （日）}[date.wday] unless is_color
    return font_tag('（日）', 'red') if date.wday == 0
    return font_tag('（土）', 'blue') if date.wday == 6
    %w{（月） （火） （水） （木） （金）}[date.wday]
  end

  def font_tag(value, color = 'black', size = nil)
    h.content_tag(:font, value, color: color, size: size)
  end

  def format_minute(time)
    "#{time}'"
  end
end
