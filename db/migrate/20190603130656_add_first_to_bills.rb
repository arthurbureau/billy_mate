class AddFirstToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :first, :boolean
  end
end
