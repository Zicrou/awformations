class AddDescriptionToCours < ActiveRecord::Migration[7.0]
  def change
    add_column :cours, :description, :text
  end
end
