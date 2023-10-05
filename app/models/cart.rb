class Cart < ApplicationRecord
    has_many :orderables

    has_many :products , through: :orderables #through: :join_association, source: :join_association_table_foreign_key_to_carts_table

    def total
      orderables.to_a.sum { |orderable| orderable.total}
    end
end
