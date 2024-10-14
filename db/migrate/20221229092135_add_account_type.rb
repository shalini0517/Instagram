class AddAccountType < ActiveRecord::Migration[7.0]
  def change
    add_column :users ,:account_type ,:integer ,:default =>1

  end
end
