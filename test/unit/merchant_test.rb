require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Merchant.new.valid?
  end
end
