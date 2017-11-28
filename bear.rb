class Bear

  attr_reader :name, :eaten_fish

  def initialize(bear_name)
    @name       = bear_name
    @eaten_fish = []
  end

  def eat_a_fish_from_river(river)
    @eaten_fish.push(river.fish.pop()) if river.fish.count() > 0 
  end


end
