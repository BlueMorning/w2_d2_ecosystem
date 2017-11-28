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



end
