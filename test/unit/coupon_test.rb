require 'test_helper'

class CouponTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Coupon.new.valid?
  end
end
