class River

  attr_reader :fish

  def initialize(river_name, array_fish = [])
    @river_name = river_name
    @fish       = array_fish
  end

  def remove_fish
    return @fish.pop()
  end

  def get_nb_fish
    return @fish.count()
  end

end
