class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user_id, null: false, foreign_key: true
      t.integer :views_count
      t.string :category
      t.string :topic
      t.string :title
      t.string :expect_co2
      t.string :expect_waste
      t.string :expect_resources
      t.string :expect_diyeffort
      t.string :expect_ecocost
    end
  end
end
