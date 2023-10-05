class AddCardToItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :card, null: false, foreign_key: true
  end
end
