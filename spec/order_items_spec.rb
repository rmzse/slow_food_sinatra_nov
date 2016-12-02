require './lib/models/order_item'

describe OrderItem do
  it{is_expected.to have_property :id}
  it{is_expected.to have_one :dish}
  it{is_expected.to belong_to :order}
end
