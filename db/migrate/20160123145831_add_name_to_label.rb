class AddNameToLabel < ActiveRecord::Migration
  def change
    add_column :labels, :name, :string
  end
end
