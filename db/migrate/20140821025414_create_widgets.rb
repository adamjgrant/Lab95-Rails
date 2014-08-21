class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :name
      t.integer :type
      t.references :panel, index: true

      t.timestamps
    end
  end
end
