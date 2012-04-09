class CreateCoupons < ActiveRecord::Migration
  def self.up
    create_table :coupons do |t|
      t.references :merchant
      t.string :short_desc
      t.string :long_desc
      t.datetime :expire_date
      t.string :ad
      t.timestamps
    end
  end

  def self.down
    drop_table :coupons
  end
end
