class AddOpeningPostToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :opening_post, :text
    add_column :posts, :score, :integer
  end
end
