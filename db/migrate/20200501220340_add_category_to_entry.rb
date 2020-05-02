class AddCategoryToEntry < ActiveRecord::Migration[6.0]
  def change
    add_reference :entries, :day, foreign_key: true
  end
end
