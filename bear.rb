class Bear

  attr_reader :name, :eaten_fish

  def initialize(bear_name)
    @name       = bear_name
    @eaten_fish = []
  end

  def eat_a_fish_from_river(river)
    @eaten_fish.push(river.remove_fish()) if river.get_nb_fish() > 0
  end

  def get_nb_eaten_fish
    return @eaten_fish.count()
  end

end
