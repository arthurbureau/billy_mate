class AddTokenToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :token, :string
  end
end
