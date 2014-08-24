class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.references :account, index: true

      t.timestamps
    end
  end
end
