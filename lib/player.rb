class Player
  attr_reader :name, :sign
  attr_writer :sign

  def initialize(name)
    @name = name
    @sign = ''
  end
end
