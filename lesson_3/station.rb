class Station
  attr_reader :train_list

  def initialize(name)
    @name = name
    @train_list = []
  end

  def train_add(train)
    @train_list << train
  end

  def train_remove(train)
    @train_list.delete(train)
  end

  def train_list_by_type(type)
    @train_list.count { |train| train.type == type  }
  end
end