class AddColumnToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :is_private, :boolean, default: false
  end
end
