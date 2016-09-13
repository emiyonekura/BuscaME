class AddLogoToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :logo, :string
  end
end
