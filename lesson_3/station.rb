class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_add(train)
    @trains << train
  end

  def train_remove(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.count { |train| train.type == type  }
  end
end