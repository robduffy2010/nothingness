class Post < ActiveRecord::Base
  belongs_to :image
  validates :content, presence: true, length: { maximum: 160 }
end
