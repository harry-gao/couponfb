class Coupon < ActiveRecord::Base
  attr_accessible :short_desc, :long_desc, :expire_date, :ad

  belongs_to :Merchant

  validates_presence_of :merchant_id

end
