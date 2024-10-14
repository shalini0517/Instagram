class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user , foreign_key: "username"
      t.string :Description

      t.timestamps
    end
  end
end
