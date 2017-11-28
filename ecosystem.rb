class Ecosystem

  attr_reader :name, :bears, :river

  def initialize(name, bears, river)
    @name  = name
    @bears = bears
    @river = river
  end

  def get_bear_by_name(bear_name)
    return @bears.select { |bear| bear.name == bear_name}.first()
  end

  def bear_eat_all_the_fish()
    while(@river.get_nb_fish > 0)
      @bears[Random.new.rand(0..(@bears.length-1))].eat_a_fish_from_river(@river)
    end
  end

  def get_all_fish_eaten_from_bears
    eaten_fish = []
    for bear in @bears
      eaten_fish.concat(bear.eaten_fish)
    end
    return eaten_fish
  end

end
