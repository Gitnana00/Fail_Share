class ChangeImageInPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :image, :string
  end
end

