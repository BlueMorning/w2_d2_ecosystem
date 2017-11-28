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
end
