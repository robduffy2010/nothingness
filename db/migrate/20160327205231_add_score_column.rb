class AddScoreColumn < ActiveRecord::Migration
  def change
	add_column :images, :score, :integer
  end
end
