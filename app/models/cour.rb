class Cour < ApplicationRecord
    has_rich_text :content
    
    has_one_attached :thumbnail
    has_one_attached :video
end
