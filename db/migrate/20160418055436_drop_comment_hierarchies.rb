class DropCommentHierarchies < ActiveRecord::Migration[5.0]
  def change
   drop_table :comment_hierarchies
  end
end
