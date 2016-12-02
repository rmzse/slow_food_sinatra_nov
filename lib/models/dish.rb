class Dish
  include DataMapper::Resource

  property :id, Serial, key: true
  property :name, String, length: 100
  property :price, Float
end
