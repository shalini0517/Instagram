class AddLoggedToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users ,:logged ,:boolean ,:default =>false
  end
end
