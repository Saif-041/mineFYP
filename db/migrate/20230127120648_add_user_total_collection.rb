class AddUserTotalCollection < ActiveRecord::Migration[7.0]
  def self.up
    add_column :users, :coins, :int, default: 1000
  end
end
