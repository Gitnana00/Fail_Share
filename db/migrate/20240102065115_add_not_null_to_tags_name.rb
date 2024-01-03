class AddNotNullToTagsName < ActiveRecord::Migration[7.0]
  def change
    change_column :tags, :name, :string, null: false
    add_index :post_tags, [:post_id, :tag_id], unique: true
  end
end
