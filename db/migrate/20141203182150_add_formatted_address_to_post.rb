class AddFormattedAddressToPost < ActiveRecord::Migration
  def change
    add_column :posts, :formatted_address, :string
  end
end
