class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :url

      t.timestamps null: false
    end
  end
end
