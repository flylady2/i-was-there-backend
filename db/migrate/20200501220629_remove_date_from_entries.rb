class RemoveDateFromEntries < ActiveRecord::Migration[6.0]
  def change

    remove_column :entries, :date, :date
  end
end
