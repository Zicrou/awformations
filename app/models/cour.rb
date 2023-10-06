class Cour < ApplicationRecord
    #belongs_to :object, class_name: "object", foreign_key: "object_id"
    has_rich_text :content
    
    has_one_attached :thumbnail
    has_one_attached :video
end
