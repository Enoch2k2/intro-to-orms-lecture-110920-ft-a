class AddNumberOfPagesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :number_of_pages, :integer, default: 0
  end
end
