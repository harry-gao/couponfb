class CreateMerchants < ActiveRecord::Migration
  def self.up
    create_table :merchants do |t|
      t.string :name
      t.string :name_on_coupon
      t.string :address
      t.string :phone
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.boolean :deleted, :default => false
      t.string :logo
      t.timestamps
    end
  end

  def self.down
    drop_table :merchants
  end
end
