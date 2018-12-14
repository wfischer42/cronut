require_relative 'test_helper'
require_relative '../lib/item'

class ItemTest < Minitest::Test

  def setup
    @items = Item.create_many_from_json('./data/cronut.json')
  end

  def test_it_exists
    assert_instance_of Item, @items[0]
  end

  def test_it_has_attributes
    assert_equal "0001", @items[0].id
    assert_equal "donut", @items[0].type
    assert_equal "Cake", @items[0].name
    assert_equal 0.55, @items[0].ppu
  end

  def test_it_has_batters
    assert_instance_of Batter, @items[0].batters[0]
  end

  def test_its_batter_has_attributes
     batter = @items[0].batters[0]
     assert_equal "1001", batter.id
     assert_equal "Regular", batter.type
  end

end
