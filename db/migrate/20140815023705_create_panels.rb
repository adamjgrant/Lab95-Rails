class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
