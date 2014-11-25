class AddCountryToPost < ActiveRecord::Migration
  def change
    add_column :posts, :country, :string
  end
end
