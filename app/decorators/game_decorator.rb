class GameDecorator < Draper::Decorator
  delegate_all

  def section_decorate
    "第#{section}節"
  end

  def date_decorate
    "#{date.strftime('%m/%d')}#{day_of_week(date)}"
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

  def temperature_decorate
  	value = "#{temperature}℃"
    return font_tag(value, 'red') if temperature >= 25
    return font_tag(value, 'blue') if temperature <= 9
    value
  end

  def dominance_rate_decorate
    "#{dominance_rate}%"
  end

  def number_of_visitors_decorate
    value = "#{number_of_visitors.to_s(:delimited)}人"
    return font_tag(value, 'red') if number_of_visitors >= 25000
    return font_tag(value, 'blue') if number_of_visitors <= 9999
    value
  end

  private

  def day_of_week(date)
    %w{（日） （月） （火） （水） （木） （金） （土）}[date.wday]
  end

  def font_tag(value, color = 'black', size = nil)
    h.content_tag(:font, value, color: color, size: size)
  end
end
