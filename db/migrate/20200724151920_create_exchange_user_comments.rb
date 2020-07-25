class CreateExchangeUserComments < ActiveRecord::Migration[6.0]
  def change
    create_table :exchange_user_comments do |t|
      t.integer :user_id
      t.integer :exchange_id
      t.timestamps
    end
  end
end
