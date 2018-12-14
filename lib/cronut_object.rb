require 'json'


class CronutObject
  attr_reader :id, :type
  def initialize(data)
    @id = data["id"]
    @type = data["type"]
  end

  def self.create_many_from_hash(data)
    type = self.to_s.downcase
    data[type].map do |batter_data|
      self.new(batter_data)
    end
  end

  
end
