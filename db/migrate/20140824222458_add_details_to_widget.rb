class AddDetailsToWidget < ActiveRecord::Migration
  def change
    add_column :widgets, :input, :integer
  end
end
