class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :image
      t.boolean :public_private
      t.boolean :anonymous
      t.integer :tags_id

      t.timestamps
    end
  end
end
