class CreateCoinUserComments < ActiveRecord::Migration[6.0]
  def change
    create_table :coin_user_comments do |t|
      t.integer :user_id
      t.text :coin_id
      t.text :comment
      t.timestamps
    end
  end
end
