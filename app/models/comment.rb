class Comment < ApplicationRecord
has_attached_file :image, styles: { thumb: ["64x64#", :jpg], medium: ['200x200>'], original: ['500x500>'] },
                  convert_options: { thumb: "-quality 75 -strip",
                                     medium: "-quality 75 -strip",
                                     original: "-quality 85 -strip" }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
belongs_to :post
end
