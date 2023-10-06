class Product < ApplicationRecord
    has_many :orderables

    has_many :carts, through: :orderables #through: :join_association, source: :join_association_table_foreign_key_to_carts_table
    
    has_rich_text :content
    
    has_one_attached :thumbnail
    has_one_attached :video
end
