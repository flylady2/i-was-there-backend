class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :content
      t.date :date
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
