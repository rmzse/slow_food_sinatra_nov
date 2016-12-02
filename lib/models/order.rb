class Order
  include DataMapper::Resource

  property :id, Serial, key: true
  property :amount, Float
  property :pickup_time, Time

  has n, :order_items, constraint: :destroy
end
