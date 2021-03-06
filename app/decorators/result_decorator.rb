class ResultDecorator < Draper::Decorator
  delegate_all

  def time_decorate
    return '' if time == 0
    return h.raw("#{time}　#{h.fa_icon('angle-double-down lg')}") if participation.starting? && time < 90 && red_card == 0
    return h.raw("#{time}　#{h.fa_icon('angle-double-up lg')}") if participation.half_way_out? && time > 0 && red_card == 0
    "#{time}　　"
  end
end