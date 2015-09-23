class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string  :url
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
