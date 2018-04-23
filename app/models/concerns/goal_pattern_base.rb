module GoalPatternBase
  extend ActiveSupport::Concern

  included do
  	extend Enumerize
    enumerize :pattern, in:
      { ck: 1, fk: 2, pk: 3, throw_in: 4, gk: 5,
        counter: 10, short_counter: 11, slow_attack: 12,
        individual:20, miss:21, own_goal: 99
      }, scope: true
    enumerize :starting_area, in: { left: 1, center: 2, right: 3 }, scope: true
    enumerize :goal_area, in: { pa_in: 1, pa_out: 2 }, scope: true
    enumerize :goal_parts, in: { left: 1, right: 2, head: 3, other: 4 }, scope: true
  end
end