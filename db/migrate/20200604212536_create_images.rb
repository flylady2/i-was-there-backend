class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :url
      t.string :caption
      t.belongs_to :day, foreign_key: true


      t.timestamps
    end
  end
end
