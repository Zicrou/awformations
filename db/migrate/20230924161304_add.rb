class Add < ActiveRecord::Migration[7.0]
  def change
    add_reference :line_items, :cour, null: false, foreign_key: true
  end
end
