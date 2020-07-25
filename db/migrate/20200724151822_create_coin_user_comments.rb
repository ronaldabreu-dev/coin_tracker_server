class CreateCoinUserComments < ActiveRecord::Migration[6.0]
  def change
    create_table :coin_user_comments do |t|
      t.integer :user_id
      t.integer :coin_id
      t.timestamps
    end
  end
end
