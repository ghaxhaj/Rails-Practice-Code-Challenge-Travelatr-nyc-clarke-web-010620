class EditLikeValue < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:posts, :likes, 0)
  end
end
