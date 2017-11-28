require_relative("fish.rb")

class River

  attr_reader :fish

  def initialize(river_name, array_fish = [])
    @river_name                  = river_name
    @fish                        = array_fish
    @fish_name_to_populate_river = ["Turbo", "Fork", "Speedy", "Crazy", "Dazzling", "Stormy", "Neo", "Fluo", "Snake", "Magnet"]
  end

  def remove_fish
    return @fish.pop()
  end

  def remove_fish_by_name(fish_name)
    return @fish.delete(@fish.select{|fish| fish.name == fish_name}.first())
  end

  def get_nb_fish
    return @fish.count()
  end

  def repopulate_river(nb_fish)
    while nb_fish > 0 do
      @fish.push(Fish.new(@fish_name_to_populate_river[Random.new.rand(0..9)]))
      nb_fish-=1
    end
  end

end
