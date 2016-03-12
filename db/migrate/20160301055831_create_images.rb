class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.belongs_to :post, index:true
      t.string :opening_post	
      t.timestamps null: false
    end
  end
end
