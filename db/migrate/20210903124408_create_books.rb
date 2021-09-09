class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.text :name_of_book
      t.text :description
      t.text :author
      t.integer :no_of_books_available
      t.integer :price

      t.timestamps
    end
  end
end
