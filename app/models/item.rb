class Item < ApplicationRecord
    has_many :line_items

    belongs_to :card, class_name: "card", foreign_key: "card_id"
end
