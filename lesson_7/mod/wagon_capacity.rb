# frozen_string_literal: true

module WagonCapacity

  attr_reader :capacity, :busy

  def take_place(amount)
    raise 'Не хватает места' if amount > self.free_place
    self.busy += amount
  end

  def free_place
    self.capacity - self.busy
  end
end