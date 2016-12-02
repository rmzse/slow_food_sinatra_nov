class OrderItem
  include DataMapper::Resource

  property :id, Serial, key: true
  has 1, :dish, through: Resource
  belongs_to :order
end
