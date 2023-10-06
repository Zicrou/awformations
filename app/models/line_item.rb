class LineItem < ApplicationRecord
    belongs_to :item, class_name: "item", foreign_key: "item_id"
end
