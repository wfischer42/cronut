require 'batter'
require 'topping'
require 'cronut_object'

class Item < CronutObject
  attr_reader :id, :type, :name, :ppu, :batters
  def initialize(data)
    super
    @name = data["name"]
    @ppu = data["ppu"]
    @batters = Batter.create_many_from_hash(data["batters"])
    @toppings = Topping.create_many_from_hash(data)
  end

  def self.create_many_from_json(file)
    data = JSON.parse(File.read(file))
    self.create_many_from_hash(data["items"])
  end
end
