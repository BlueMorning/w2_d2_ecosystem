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

  def eat_fish_by_name(river, fish_name)
    fish = river.remove_fish_by_name(fish_name)
    @eaten_fish.push(fish) if fish != nil
    return fish
  end

  def grunt_yummy_when_eating_fish(river, fish_name)
    return "#{fish_name} yummy yummy !" if eat_fish_by_name(river, fish_name) != nil
    return nil
  end

end
